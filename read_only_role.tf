resource "aws_iam_role" "readonly" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_readonly"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

# tfs_read_only policy is in tfs_common_policies.tf 
# as it is used by multiple roles in additin to this one.
resource "aws_iam_role_policy_attachment" "readonly" {
  role       = "${aws_iam_role.readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "readonly1" {
  role       = "${aws_iam_role.readonly.id}"
  policy_arn = "${aws_iam_policy.tfs_read_only.arn}"
}

#Attach Read Only denies here

### Outputs
output "read_only_role_name" {
  value = "${aws_iam_role.readonly.id}"
}

output "read_only_role_arn" {
  value = "${aws_iam_role.readonly.arn}"
}
