resource "aws_security_group" "security_group" {
  name_prefix            = var.name_prefix
  name_prefix            = var.name_prefix
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete 

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = [ingress.value["cidr_blocks"]]
      description = ingress.value["description"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, map( "Name", "terraform-demo-security-group", ))
}