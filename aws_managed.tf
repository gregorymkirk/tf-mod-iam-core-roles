#Roles with AWS only mnanaged policies.

### tfs-srv-backup-role ###

resource "aws_iam_role" "tfs-srv-backup-role" {
  name                 = "tfs-srv-backup-role"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfs-srv-backup-role1" {
  role       = "${aws_iam_role.tfs-srv-backup-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_iam_role_policy_attachment" "tfs-srv-backup-role2" {
  role       = "${aws_iam_role.tfs-srv-backup-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
}


### tfs-srv-es-qualys-connector-role ###

resource "aws_iam_role" "tfs-srv-es-qualys-connector-role" {
  name                 = "tfs-srv-es-qualys-connector-role"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfs-srv-es-qualys-connector-role" {
  role       = "${aws_iam_role.tfs-srv-es-qualys-connector-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

### tfsaws-eks-master-role ###

resource "aws_iam_role" "tfsaws-eks-master-role" {
  name                 = "tfsaws-eks-master-role"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfsaws-eks-master-role1" {
  role       = "${aws_iam_role.tfsaws-eks-master-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "tfsaws-eks-master-role2" {
  role       = "${aws_iam_role.tfsaws-eks-master-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}


### tfsaws-eks-service-role ###
###NOTE this is identical to  tfsaws-eks-master-role, can we eliminate 1? 

resource "aws_iam_role" "tfsaws-eks-service-role" {
  name                 = "tfsaws-eks-service-role"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" tfsaws-eks-service-role1" {
  role       = "${aws_iam_role.tfsaws-eks-service-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "tfsaws-eks-master-role2" {
  role       = "${aws_iam_role.tfsaws-eks-service-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

### READ ONLY ACCESS ROLES ###

### tfsawssubprod_compute_readonly ###

resource "aws_iam_role" "tfsawssubprod_compute_readonly" {
  name                 = "tfsawssubprod_compute_readonly"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfsawssubprod_compute_readonly" {
  role       = "${aws_iam_role.tfsawssubprod_compute_readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

### tfsawssubprod_database_readonly ###

resource "aws_iam_role" "tfsawssubprod_database_readonly" {
  name                 = "tfsawssubprod_database_readonly"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfsawssubprod_database_readonly" {
  role       = "${aws_iam_role.tfsawssubprod_database_readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

### tfsawssubprod_iam_admin_readonly ###

resource "aws_iam_role" "tfsawssubprod_iam_admin_readonly" {
  name                 = "tfsawssubprod_iam_admin_readonly"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfsawssubprod_iam_admin_readonly" {
  role       = "${aws_iam_role.tfsawssubprod_iam_admin_readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


### tfsawssubprod_monitoring_readonly  ####

resource "aws_iam_role" "tfsawssubprod_monitoring_readonly" {
  name                 = "tfsawssubprod_monitoring_readonly"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfsawssubprod_monitoring_readonly" {
  role       = "${aws_iam_role.tfsawssubprod_monitoring_readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

#### tfsawssubprod_network_readonly ###

resource "aws_iam_role" "tfsawssubprod_network_readonly" {
  name                 = "tfsawssubprod_network_readonly"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfsawssubprod_network_readonly" {
  role       = "${aws_iam_role.tfsawssubprod_network_readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


####  tfsawssubprod_storage_readonly  ####

resource "aws_iam_role" "tfsawssubprod_storage_readonly" {
  name                 = "tfsawssubprod_storage_readonly"
  permissions_boundary = "${aws_iam_policy.boundary_policy.arn}"
  assume_role_policy   = "${data.template_file.assume_admin_role_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "tfsawssubprod_storage_readonly" {
  role       = "${aws_iam_role.tfsawssubprod_storage_readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}