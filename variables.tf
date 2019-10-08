variable "sg_name_prefix" {
    description = "Creates a unique name beginning with the specified prefix."
}

variable "sg_description" {
    description = "The security group description. Defaults to Managed by Terraform."
}

variable "sg_vpc_id" {
    description = "The VPC ID."
}

variable "common_tags" {
    description = "A mapping of tags to assign to the resource."
}

variable "sg_ingress_rules" {
    description = ""
  type = list(map(string))
}