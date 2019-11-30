variable "name_prefix" {
    description = "Creates a unique name beginning with the specified prefix."
}

variable "description" {
    description = "The security group description. Defaults to Managed by Terraform."
}

variable "vpc_id" {
    description = "The VPC ID."
}

variable "common_tags" {
    description = "A mapping of tags to assign to the resource."
    type        = map(string)
}

variable "ingress_rules" {
    description = "Ingress rules for security group"
    type        = list(map(string))
}

variable "egress_rules" {
    description = "Egress rules for security group"
    type        = list(map(string))
}