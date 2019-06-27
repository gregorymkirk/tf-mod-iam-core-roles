# tf-aws-mod-iam-core-roles


A terraform module to build the core IAM roles for all subsequent accounts.



## Assumptions

You want to create a set of AIM roles that will allow the applciatin tem to manage their resourcfes while preventing them from esapting the boudnary permissions.
	admin-role
	readonly-role
	...

## Usage example 1 (Default:   3 Tier Load Balancer/Data/App  each with 2 subnets in different Availabiltiy Zones)

```hcl

module "iamcore" {
  source      = "../tf-aws-mod-iam-core-roles"

}
```



## Authors

Created Gregory Kirk (gregopry.kirk@toyota.com/gkirk@smartronics.com)


## Inputs




## Outputs

