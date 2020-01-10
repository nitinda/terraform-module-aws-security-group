# Terraform Module Name: terraform-module-aws-security-group


## General

_This module may be used to create_ **_Security Group_** _resources in AWS cloud provider...._

---


## Prerequisites

_This module needs_ **_Terraform 0.12.16_** _or newer._
_You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html)._

_This module deploys aws services details are in respective feature branches._

---


## Below are the resources that are launched by this module

_Below we are able to check the resources that are being created as part of this module call:_


- **_Security Group_**


---

## Usage

## Using this repo

_To use this module, add the following call to your code:_

```tf
module "<layer>-security-group-<AccountID>" {
  source = "git::https://github.com/nitinda/terraform-module-aws-security-group.git?ref=terraform-12/master"

  providers = {
    aws = aws.services
  }

  # Tags
  tags = merge(
    var.common_tags,
    {
      "Name"      = "service-sg"
      "ManagedBy" = "Terraform"
    },
  )

  # Security Groups
  name_prefix            = "service-sg-"
  description            = "Code Build EC2 Instance security group that allows traffic from whitelisted ips"
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = true
  ingress_rules = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      description      = "Ingress rule that allows traffic from subnets"
      cidr_blocks      = [ var.vpc_cidr ]
    }
  ]
  egress_rules = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      description     = "The egress rule allows all ports"
    }
  ]

}
```
---

## Inputs

_The variables required in order for the module to be successfully called from the deployment repository are the following:_


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_name\_prefix_** | Name prefix | _string_ | **_Required_** |
| **_description_** | description | _string_ | **_Required_** |
| **_vpc\_id_** | VPC ID | _string_ | **_Required_** |
| **_tags_** | Resource Tag | _map(string)_ | **_Required_** |
| **_revoke\_rules\_on\_delete_** | Instruct Terraform to revoke | _string_ | **_Optional_** *(Default - **false**)* |
| **_ingress\_rules_** | Ingress Rules | _any_ | **_Optional_** *(Default - **[]**)* |
| **_egress\_rules_** | Egress Rules | _any_ | **_Optional_** *(Default - **[]**)* |



## Outputs

- **_id_**
- **_arn_**
- **_name_**




### Usage
_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```

_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```

## Authors
_Module maintained by Module maintained by the -_**_Nitin Das_**