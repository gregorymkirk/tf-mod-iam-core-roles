resource "aws_iam_role" "network_admin" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_network_admin"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

resource "aws_iam_policy" "tfs_network_admin_policy" {
  name        = "tfs_network_admin_policy"
  path        = "/core/"
  description = "tfs_network_admin_policy"
  policy      = "${file("${path.module}/policy-templates/tfs_network_admin_policy.json")}"
}

resource "aws_iam_role_policy_attachment" "network_admin1" {
  role       = "${aws_iam_role.network_admin.id}"
  policy_arn = "${aws_iam_policy.tfs_read_only.arn}"
}

resource "aws_iam_role_policy_attachment" "network_admin2" {
  role       = "${aws_iam_role.network_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

resource "aws_iam_role_policy_attachment" "network_admin3" {
  role       = "${aws_iam_role.network_admin.id}"
  policy_arn = "${aws_iam_policy.network_admin.arn}"
}


output "network_admin_role_name" {
  value = "${{aws_iam_role.network_admin.id}"
}
output "network_admin_role_arn" {
  value = "${aws_iam_role.network_admin.arn}"
}