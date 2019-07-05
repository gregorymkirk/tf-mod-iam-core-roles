resource "aws_iam_role" "srv-es-qualys-connector" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}-srv-es-qualys-connector-role"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

resource "aws_iam_role_policy_attachment" "srv-es-qualys-connector" {
  role       = "${aws_iam_role.srv-es-qualys-connector.id}"
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

output "srv_es_qualys_connector_role_name" {
  value = "${aws_iam_role.srv-es-qualys-connector.id}"
}

output "srv_es_qualys_connector_role_arn" {
  value = "${aws_iam_role.srv-es-qualys-connector.arn}"
}
