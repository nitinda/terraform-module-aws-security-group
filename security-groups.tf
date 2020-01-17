resource "aws_security_group" "security_group" {
  name_prefix            = var.name_prefix
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete 
  tags                   = var.tags

  lifecycle {
    create_before_destroy = true
  }

  dynamic "ingress" {
      for_each = length(var.ingress_rules) == 0 ? [] : var.ingress_rules
      content {
          from_port        = lookup(ingress.value, "from_port", null)
          to_port          = lookup(ingress.value, "to_port", null)
          protocol         = lookup(ingress.value, "protocol", null)
          cidr_blocks      = lookup(ingress.value, "cidr_blocks", [])
          description      = lookup(ingress.value, "description", null)
          self             = lookup(ingress.value, "self", false)
          security_groups  = lookup(ingress.value, "security_groups", [])
          ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", [])
          prefix_list_ids  = lookup(ingress.value, "prefix_list_ids", [])
      }
  }

  dynamic "egress" {
      for_each = length(var.egress_rules) == 0 ? [] : var.egress_rules
      content {
          from_port        = lookup(egress.value, "from_port", null)
          to_port          = lookup(egress.value, "to_port", null)
          protocol         = lookup(egress.value, "protocol", null)
          cidr_blocks      = lookup(egress.value, "cidr_blocks", [])
          description      = lookup(egress.value, "description", null)
          self             = lookup(egress.value, "self", false)
          security_groups  = lookup(egress.value, "security_groups", [])
          ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", [])
          prefix_list_ids  = lookup(egress.value, "prefix_list_ids", [])
      }
  }
}