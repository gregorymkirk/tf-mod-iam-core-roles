resource "aws_iam_role" "eks_admin" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}_eks_admin"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

data "template_file" "eks_admim_policy_doc" {
  template = "${file("${path.module}/policy-templates/tfs_eks_admin_policy.json")}"
}

resource "aws_iam_policy" "eks_admin" {
  name        = "tfs_eks_admin_policy"
  path        = "/core/"
  description = "tfs_eks_admin_policy"
  policy      = "${data.template_file.eks_admim_policy_doc.rendered}"
}

resource "aws_iam_role_policy_attachment" "eks_admin1" {
  role       = "${aws_iam_role.eks_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "eks_admin2" {
  role       = "${aws_iam_role.eks_admin.id}"
  policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

resource "aws_iam_role_policy_attachment" "eks_admin3" {
  role       = "${aws_iam_role.eks_admin.id}"
  policy_arn = "${aws_iam_policy.eks_admin.arn}"
}

output "eks_admin_role_name" {
  value = "${aws_iam_role.eks_admin.id}"
}

output "eks_admin_role_arn" {
  value = "${aws_iam_role.eks_admin.arn}"
}
