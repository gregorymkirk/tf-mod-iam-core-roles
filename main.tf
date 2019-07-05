#iam policies and roles for Sanbox 2.0

# Get the current account number
data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}
