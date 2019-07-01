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
