resource "aws_iam_role" "monitoring_admin" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_monitoring_admin"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

data "template_file" "monitoring_admin_policy_doc" {
  template = "${file("${path.module}/policy-templates/tfs_monitoring_admin_policy.json")}"
}

resource "aws_iam_policy" "monitoring_admin" {
  name        = "tfs_monitoring_admin_policy"
  path        = "/core/"
  description = "tfs_monitoring_admin_policy"
  policy      = "${data.template_file.monitoring_admin_policy_doc.rendered}"
}

resource "aws_iam_role_policy_attachment" "monitoring_admin1" {
  role       = "${aws_iam_role.monitoring_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "monitoring_admin2" {
  role       = "${aws_iam_role.monitoring_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

resource "aws_iam_role_policy_attachment" "monitoring_admin3" {
  role       = "${aws_iam_role.monitoring_admin.id}"
  policy_arn = "${aws_iam_policy.monitoring_admin.arn}"
}

output "monitoring_admin_role_name" {
  value = "${aws_iam_role.monitoring_admin.id}"
}

output "monitoring_admin_role_arn" {
  value = "${aws_iam_role.monitoring_admin.arn}"
}
