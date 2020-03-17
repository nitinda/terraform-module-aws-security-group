variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  default     = null
}

variable "name" {
  description = "The name of the security group"
  default     = null
}

variable "description" {
  description = "The security group description. Defaults to Managed by Terraform"
  default     = null
}

variable "ingress" {
    description = "Ingress rules for security group"
    type        = any
    default     = []
}

variable "egress" {
    description = "Egress rules for security group"
    type        = any
    default     = []
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself"
  type        = bool
  default     = false
}

variable "vpc_id" {
    description = "The VPC ID"
}

variable "tags" {
    description = "A mapping of tags to assign to the resource."
    type        = map(string)
    default     = {}
}