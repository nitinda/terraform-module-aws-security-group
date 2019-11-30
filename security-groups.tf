resource "aws_security_group" "security_group" {
  name_prefix            = var.name_prefix
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete 

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port       = ingress.value["from_port"]
      to_port         = ingress.value["to_port"]
      protocol        = ingress.value["protocol"]
      cidr_block      = [ingress.value["cidr_blocks"]]
      description     = ingress.value["description"]
      self            = ingress.value["self"]
      security_groups = [ingress.value["security_groups"]]
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port       = egress.value["from_port"]
      to_port         = egress.value["to_port"]
      protocol        = egress.value["protocol"]
      cidr_blocks     = [egress.value["cidr_blocks"]]
      description     = egress.value["description"]
      self            = egress.value["self"]
      self            = egress.value["self"]
      security_groups = [egress.value["security_groups"]]
    }
  }

  tags = var.common_tags

  lifecycle {
    create_before_destroy = true
  }
}