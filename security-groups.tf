resource "aws_security_group" "security_group" {
  name_prefix            = var.name_prefix
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete 
  ingress                = var.ingress_rules
  egress                 = var.egress_rules
  tags                   = var.common_tags

  lifecycle {
    create_before_destroy = true
  }
}