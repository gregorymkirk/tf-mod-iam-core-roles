resource "aws_iam_role" "eks-service-role" {
  name                 = "${data.aws_iam_account_alias.current.account_alias}-eks-service-role"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
  path                 = "/core/"
}

resource "aws_iam_role_policy_attachment" "eks-service-role1" {
  role       = "${aws_iam_role.eks-service-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks-service-role2" {
  role       = "${aws_iam_role.eks-service-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

output "srv_eks_service_role_name" {
  value = "${aws_iam_role.eks-service-role.id}"
}

output "srv_eks_service_role_arn" {
  value = "${aws_iam_role.eks-service-role.arn}"
}
