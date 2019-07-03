resource "aws_iam_role" "infra_security_admin" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_infra_security_admin"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

resource "aws_iam_policy" "tfs_infra_security_admin_policy" {
  name        = "tfs_infra_security_admin_policy"
  path        = "/core/"
  description = "tfs_infra_security_admin_policy"
  policy      = "${file("${path.module}/policy-templates/tfs_infra_security_admin_policy.json")}"
}

resource "aws_iam_role_policy_attachment" "infra_security_admin1" {
  role       = "${aws_iam_role.infra_security_admin.id}"
  policy_arn = "${aws_iam_policy.tfs_read_only.arn}"
}

resource "aws_iam_role_policy_attachment" "infra_security_admin2" {
  role       = "${aws_iam_role.infra_security_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/AWSSecurityHubReadOnlyAccess"
}

output "infra_security_admin_role_name" {
  value = "${{aws_iam_role.infra_security_admin.id}"
}
output "infra_security_admin_role_arn" {
  value = "${aws_iam_role.infra_security_admin.arn}"
}