resource "aws_iam_role" "database_admin" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_database_admin"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

resource "aws_iam_policy" "tfs_database_admin_policy" {
  name        = "tfs_database_admin_policy"
  path        = "/core/"
  description = "tfs_database_admin_policy"
  policy      = "${file("${path.module}/policy-templates/tfs_database_admin_policy.json")}"
}

resource "aws_iam_role_policy_attachment" "compute_admin1" {
  role       = "${aws_iam_role.tfsawssubprod_compute_readonly.id}"
  policy_arn = "${aws_iam_policy.tfs_read_only.arn}"
}

resource "aws_iam_role_policy_attachment" "compute_admin2" {
  role       = "${aws_iam_role.tfsawssubprod_compute_readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

resource "aws_iam_role_policy_attachment" "compute_admin3" {
  role       = "${aws_iam_role.tfsawssubprod_compute_readonly.id}"
  policy_arn = "${aws_iam_policy.database_admin.arn}"
}


output "database_admin_role_name" {
  value = "${{aws_iam_role.database_admin.id}"
}
output "database_admin_role_arn" {
  value = "${aws_iam_role.database_admin.arn}"
}