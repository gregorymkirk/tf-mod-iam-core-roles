resource "aws_iam_role" "storage_admin" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_storage_admin"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

resource "aws_iam_policy" "tfs_storage_admin_policy" {
  name        = "tfs_storage_admin_policy"
  path        = "/core/"
  description = "tfs_storage_admin_policy"
  policy      = "${file("${path.module}/policy-templates/tfs_storage_admin_policy.json")}"
}

resource "aws_iam_role_policy_attachment" "storage_admin1" {
  role       = "${aws_iam_role.storage_admin.id}"
  policy_arn = "${aws_iam_policy.tfs_read_only.arn}"
}

resource "aws_iam_role_policy_attachment" "storage_admin2" {
  role       = "${aws_iam_role.storage_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

resource "aws_iam_role_policy_attachment" "storage__admin3" {
  role       = "${aws_iam_role.storage_admin.id}"
  policy_arn = "${aws_iam_policy.storage_admin.arn}"
}

output "storage_admin_role_name" {
  value = "${{aws_iam_role.storage_admin.id}"
}
output "storage_admin_role_arn" {
  value = "${aws_iam_role.storage_admin.arn}"
}

