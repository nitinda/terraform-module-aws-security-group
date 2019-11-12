## Security Group
variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
}

variable "description" {
  description = "The security group description"
}

variable "vpc_id" {
  description = "The VPC ID."
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself."
}

variable "ingress" {
  description = "Can be specified multiple times for each ingress rule."
  type        = "list"
}

variable "egress" {
  description = "Can be specified multiple times for each egress rule."
  type        = "list"
}

## Tags
variable common_tags {
  description = "Resources Tags"
  type        = "map"
}