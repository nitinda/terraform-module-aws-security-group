# Terraform Module Name: terraform-module-aws-security-group


## General

This module may be used to create **_Security Group_** resources in AWS cloud provider..

---


## Prerequisites

This module needs Terraform 0.11.10 or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).

This module deploys aws services details are in respective feature branches.

---

## Features Branches

Below we are able to check the resources that are being created as part of this module call:

From branch : **_terrform-11/master_**

- **_Security Group_** *(Terraform 11 supported code)*



---

## Below are the resources that are launched by this module

- **_Security Group_**


---

## Usage

## Using this repo

To use this module, add the following call to your code:

```tf
module "<layer>-security-group-<AccountID>" {
  source = "git::https://github.com/nitinda/terraform-module-aws-security-group.git?ref=terraform-11/master"

  providers = {
    "aws" = "aws.services"
  }

  # Tags
  common_tags = "${merge(var.common_tags, map(
    "Name", "sg-ec2",
    "ManagedBy", "Terraform"
  ))}"

  # Security Groups
  name_prefix            = "sg-ec2-"
  description            = "The EC2 security group that allows traffic from whitelisted ips"
  vpc_id                 = "${var.vpc_id}"
  revoke_rules_on_delete = true
  ingress                = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Ingress rule that allows traffic from subnets"
      cidr_blocks = [
        "10.30.0.0/16"  #VPC Cidr
      ]
    }
  ]
  egress                 = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "The egress rule allows all ports"
    }
  ]


}
```
---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:


|         **_Variable_**        |              **_Description_**              |    **_Type_**   |
|-------------------------------|---------------------------------------------|-----------------|
| name_prefix                   | Name prefix                                 | string          |
| description                   | description                                 | string          |
| vpc_id                        | VPC ID                                      | String          |
| common_tags                   | Tag                                         | map             |
| revoke_rules_on_delete        | Instruct Terraform to revoke                | string          |
| ingress                       | Ingress Rules                               | list of maps    |
| egress                        | Egress Rules                                | list of maps    |





## Outputs

- **_id_**
- **_arn_**
- **_name_**




### Usage
In order for the variables to be accessed on module level please use the syntax below:

```tf
module.<module_name>.<output_variable_name>
```

If an output variable needs to be exposed on root level in order to be accessed through terraform state file follow the steps below:

- Include the syntax above in the network layer output terraform file.
- Add the code snippet below to the variables/global_variables file.

```tf
data "terraform_remote_state" "<module_name>" {
  backend = "s3"

  config {
    bucket = <bucket_name> (i.e. "s3-webstack-terraform-state")
    key    = <state_file_relative_path> (i.e. "env:/${terraform.workspace}/4_Networking/terraform.tfstate")
    region = <bucket_region> (i.e. "eu-central-1")
  }
}
```

- The output variable is able to be accessed through terraform state file using the syntax below:

```tf
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```

## Authors
Module maintained by Module maintained by the - **_Nitin Das_**