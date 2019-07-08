#Render the boudnary Policy from the template
data "template_file" "boundary_policy_doc" {
  template = "${file("${path.module}/policy-templates/tfs_boundary_policy.json.tpl")}"

  vars = {
    local_acct_num = "${data.aws_caller_identity.current.account_id}"
  }
}

resource "aws_iam_policy" "boundary_policy" {
  name        = "tfs_boundary"
  path        = "/core/"
  description = "TFS Boundary Policy"
  policy      = "${data.template_file.boundary_policy_doc.rendered}"
}

### Assume rolt policy

data "template_file" "assume_admin_role_policy" {
  template = "${file("${path.module}/policy-templates/assume_admin_role_policy.json.tpl")}"

  vars = {
    mgmt_acct_num = "${var.management_account}"
  }
}

## Read only limit policy 
resource "aws_iam_policy" "tfs_read_only" {
  name        = "tfs_read_only_access_limits_policy"
  path        = "/"
  description = "ec2_admin_policy"
  policy      = "${file("${path.module}/policy-templates/tfs_read_only_limits.json")}"
}
