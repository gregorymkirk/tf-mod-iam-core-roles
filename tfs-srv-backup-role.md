<!-- tfs-srv-backup-role
	AWSBackupServiceRolePolicyForBackup
	AWSBackupServiceRolePolicyForRestores
 -->

<!-- tfs-srv-es-qualys-connector-role
	SecurityAudit
 -->

 <!-- tfsaws-eks-master-role
	AmazonEKSClusterPolicy
	AmazonEKSServicePolicy
 -->

 <!-- 
tfsawssubprod_compute_readonly
	ReadOnlyAccess
 -->

 <!-- tfsawssubprod_database_readonly
	ReadOnlyAccess
 -->

 <!-- tfsawssubprod_iam_admin_readonly
	ReadOnlyAccess -->

<!-- tfsawssubprod_monitoring_readonly
	ReadOnlyAccess
 -->

 <!-- tfsawssubprod_network_readonly
	ReadOnlyAccess -->

<!-- tfsawssubprod_storage_readonly
	ReadOnlyAccess
 -->

tfsawssubprod_infrasecurity_readonly
	AWSSecurityHubReadOnlyAccess
	ReadOnlyAccess

tfs-srv-ec2-base-role
	tfs-srv-ec2-base-policy


tfsaws-ec2-base-role
	tfsaws-ec2-base-policy

tfsawssubprod_compute_admins
	ReadOnlyAccess
	tfs_base_admin_policy
	tfs_compute_admin_policy

tfsawssubprod_database_admins
	ReadOnlyAccess
	tfs_base_admin_policy
	tfs_database_admin_policy


tfsawssubprod_ec2_ssm_role
	tfs_base_ec2_policy

tfsawssubprod_eks_admins
	ReadOnlyAccess
	tfs_base_admin_policy
	tfs_eks_admin_policy

tfsawssubprod_full_admins
	AdministratorAccess

tfsawssubprod_iam_admins
	ReadOnlyAccess
	tfs_base_admin_policy
	tfs_iam_admin_policy


tfsawssubprod_infrasecurity_admins
	AWSSecurityHubReadOnlyAccess
	ReadOnlyAccess



tfsawssubprod_monitoring_admins
	ReadOnlyAccess
	tfs_base_admin_policy
	tfs_monitoring_admin_policy


tfsawssubprod_network_admins
	ReadOnlyAccess
	tfs_base_admin_policy
	tfs_network_admin_policy


tfsawssubprod_storage_admins
	ReadOnlyAccess
	AWSBackupServiceRolePolicyForBackup
	tfs_base_admin_policy
	tfs_storage_admin_policy
	AWSBackupAdminPolicy
	AWSBackupServiceRolePolicyForRestores


tfsawssubprod-redlock-readonly
	Redlock-IAM-ReadOnly-Policy (inline)
	SecurityAudit


tfsawssubprod-vpcflowlogs-role
	tfsawssubprod-vpcflowlogs-policy (inline)
