resource "aws_iam_role" "database_admin" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_database_admin"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

data "template_file" "database_policy_doc" {
  template = "${file("${path.module}/policy-templates/tfs_database_admin_policy.json")}"
}

resource "aws_iam_policy" "database_admin" {
  name        = "tfs_database_admin_policy"
  path        = "/core/"
  description = "tfs_database_admin_policy"
  policy      = "${data.template_file.database_policy_doc.rendered}"
}

resource "aws_iam_role_policy_attachment" "database_admin1" {
  role       = "${aws_iam_role.database_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "database_admin2" {
  role       = "${aws_iam_role.database_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

resource "aws_iam_role_policy_attachment" "database_admin3" {
  role       = "${aws_iam_role.database_admin.id}"
  policy_arn = "${aws_iam_policy.database_admin.arn}"
}

output "database_admin_role_name" {
  value = "${aws_iam_role.database_admin.id}"
}

output "database_admin_role_arn" {
  value = "${aws_iam_role.database_admin.arn}"
}
