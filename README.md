# tf-aws-mod-iam-core-roles


A terraform module to build the core IAM roles for all subsequent accounts.  The module creates teh standard core TFS admin Roles.  It needs to be run only once per account.



## Assumptions

You want to create a set of AIM roles that will allow the applciation team to manage their resources while preventing them from escaping the boudnary permissions built into these roles.  Some roles have custom policies, other use AWS managed policies.  All roles have a boundary policy wich limts the ability for the role to assume unwated privileges. See *Outputs* for list of roles:




## Usage example 

Calling this module as part of an intial accoutn setup. 

```

module "iamcore" {
  source      = "../tf-aws-mod-iam-core-roles"

}
```



## Authors

Created Gregory Kirk (gregopry.kirk@toyota.com/gkirk@smartronics.com)


## Inputs

N/A  The module just needs to be called as part of a terraform solution, see the *Usage Example* above


## Outputs

###Adds the following roles to the account, & llinks them the the appropriate policies

* Compute Admin
* Database Admin
* EKS Admin
* Infra Sec Admin
* Network Admin
* Read Only Riole
* Srv Backup
* EKS Service 
* Srv Auqlys Connector
* Storage Admin

###Adds the following Customer Managed Policies to the Acount:
Used as boundary policies:
* tfs_boundary
* tfs_read_only_access_limits_policy

Used as permissions policies:
* tfs_compute_admin_policy
* tfs_database_admin_policy
* tfs_eks_admin_policy
* tfs_monitoring_admin_policy
* tfs_network_admin_policy
* tfs_network_boundary_policy
* tfs_read_only_limits
* tfs_storage_admin_policy
