resource "aws_security_group" "security_group" {
  name_prefix            = var.name_prefix
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete 

  // dynamic "ingress" {
  //   for_each = var.ingress_rules
  //   content {
  //     from_port   = ingress.value["from_port"]
  //     to_port     = ingress.value["to_port"]
  //     protocol    = ingress.value["protocol"]
  //     cidr_blocks = [ingress.value["cidr_blocks"]]
  //     description = ingress.value["description"]
  //   }
  // }

  ingress = var.ingress_rules
  egress  = var.egress_rules

  // egress {
  //   from_port   = 0
  //   to_port     = 0
  //   protocol    = -1
  //   cidr_blocks = ["0.0.0.0/0"]
  // }

  tags = var.common_tags

  lifecycle {
    create_before_destroy = true
  }
}