#iam policies and roles for Sanbox 2.0

# Get the current account number
data "aws_caller_identity" "current" {}

#Render the boudnary Policy from the template
data "template_file" "boundary_policy_doc" {
  template = "${file("${path.module}/policy-templates/tfs_boundary_policy.json")}"

  vars = {
    acct_num = "${data.aws_caller_identity.current.account_id}"
  }
}

#Create the boundary policy IAM object
resource "aws_iam_policy" "boundary_policy" {
  name        = "tfs_boundary"
  path        = "/"
  description = "TFS Boundary Policy"
  policy      = "${data.template_file.boundary_policy_doc.rendered}"
}

data "template_file" "assume_admin_role_policy" {
  template = "${file("${path.module}/policy-templates/assume_admin_role_policy.json")}"

  vars = {
    acct_num = "${var.master_account}"
  }
}

# Read in and create the sandbox IAM admin user policy
data "template_file" "admin_policy_doc" {
  template = "${file("${path.module}/policy-templates/ec2_admin.json")}"
}

resource "aws_iam_policy" "admin_policy" {
  name        = "tfs_admin_policy"
  path        = "/"
  description = "Admin User Policy"
  policy      = "${data.template_file.admin_policy_doc.rendered}"
}

resource "aws_iam_role" "admin_role" {
  name                 = "tfs_admin_role"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "admin_attach" {
  role       = "${aws_iam_role.admin_role.id}"
  policy_arn = "${aws_iam_policy.admin_policy.arn}"
}

# resource "aws_iam_role" "read_only_role" {
#   name                 = "sandbox_read_only_role"
#   permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
#   assume_role_policy   = "${data.template_file.assume_ro_role_policy.rendered}"
# }


# resource "aws_iam_role_policy_attachment" "read_only_attach" {
#   role       = "${aws_iam_role.read_only_role.name}"
#   policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
# }

