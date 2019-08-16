### Items in ALL caps need to be changed to create a new role

##Creates teh role, attaches the permissions boundary (defined elsewhere)
resource "aws_iam_role" "EXAMPLEROLE" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_EXAMPLEROLE"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

#### Createa  a Cusotmer manage policy and attach it to the role created above.

### Polciy doc could also be a template, if so you will need to add the vars{} section to handle the substitutions
data "template_file" "EXAMPLEROLE_policy_doc" {
  template = "${file("${path.module}/policy-templates/POLICY_DOC")}"
}

resource "aws_iam_policy" "EXAMPLEROLE" {
  name        = "tfs_EXAMPLEROLE_policy"
  path        = "/core/"
  description = "tfs_EXAMPLEROLE_policy"
  policy      = "${data.template_file.admin_policy_doc.rendered}"
}

resource "aws_iam_role_policy_attachment" "EXAMPLEROLE3" {
  role       = "${aws_iam_role.EXAMPLEROLE.id}"
  policy_arn = "${aws_iam_policy.EXAMPLEROLE.arn}"
}

resource "aws_iam_role_policy_attachment" "EXAMPLEROLE1" {
  role       = "${aws_iam_role.EXAMPLEROLE.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "EXAMPLEROLE2" {
  role       = "${aws_iam_role.EXAMPLEROLE.id}"
  policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

output "EXAMPLEROLE_role_name" {
  value = "${aws_iam_role.EXAMPLEROLE.id}"
}

output "EXAMPLEROLE_role_arn" {
  value = "${aws_iam_role.EXAMPLEROLE.arn}"
}
