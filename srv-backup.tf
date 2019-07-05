resource "aws_iam_role" "srv-backup-role" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}-srv-backup-role"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

resource "aws_iam_role_policy_attachment" "srv-backup-role1" {
  role       = "${aws_iam_role.srv-backup-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_iam_role_policy_attachment" "srv-backup-role2" {
  role       = "${aws_iam_role.srv-backup-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
}

output "srv_backup_role_name" {
  value = "${aws_iam_role.srv-backup-role.id}"
}

output "srv_backup_role_arn" {
  value = "${aws_iam_role.compute_admin.arn}"
}
