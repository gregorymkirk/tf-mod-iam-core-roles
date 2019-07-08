{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "iam:DeletePolicy",
        "iam:DeletePolicyVersion",
        "iam:CreatePolicyVersion"
      ],
      "Resource": "arn:aws:iam::${local_acct_num}:policy/core/*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "iam:Delete*",
        "iam:Create*",
        "iam:Attach*",
        "iam:Detach*",
        "iam:Put*",
        "iam:Update*",
        "iam:TagRole",
        "iam:UntagRole"
      ],
      "Resource": "arn:aws:iam::${acct_num}:role/core/*"
    },    
    {
      "Effect": "Deny",
      "Action": [
        "iam:DeleteRolePermissionsBoundary",
        "iam:DeleteUserPermissionsBoundary"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "iam:CreateRole",
        "iam:PutRolePermissionsBoundary"
      ],
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "iam:PermissionsBoundary": "arn:aws:iam::${acct_num}:policy/core/tfs_boundary"
        }
      }
    },
    {
      "Effect": "Deny",
      "Action": [
        "iam:*User",
        "iam:*Group"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "ec2:AssociateDhcpOptions",
        "ec2:createDhcpOptions",
        "ec2:DeleteDhcpOptions",
        "ec2:CreateNetworkAcl",
        "ec2:*AclEntry",
        "ec2:DeleteNetworkAcl",
        "ec2:CreateSubnet",
        "ec2:DeleteSubnet",
        "ec2:CreateKeyPair",
        "ec2:DeleteKeyPair",
        "ec2:ImportKeyPair",
        "ec2:CreateSecurityGroup",
        "ec2:DeleteSecurityGroup",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:CreateNatGateway",
        "ec2:DeleteNatGateway",
        "ec2:AttachInternetGateway",
        "ec2:DeleteInternetGateway",
        "ec2:DetachInternetGateway",        
        "ec2:CreateEgressOnlyInternetGateway",
        "ec2:DeleteEgressOnlyInternetGateway",
        "ec2:*TrafficMirror*",
        "ec2:*TransitGateway*",
        "ec2:CreateVpc",
        "ec2:DeleteVpc",
        "ec2:CreateDefaultVpc",
        "ec2:*VpcCidrBlock"
      ],
      "Resource": "*"
    }
   
  ]
}
