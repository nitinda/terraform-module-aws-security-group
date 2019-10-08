resource "aws_security_group" "security_group" {
  name_prefix = var.sg_name_prefix
  description = var.sg_description
  vpc_id      = var.sg_vpc_id

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      from_port   = sg_ingress_rules.value["from_port"]
      to_port     = sg_ingress_rules.value["to_port"]
      protocol    = sg_ingress_rules.value["protocol"]
      cidr_blocks = sg_ingress_rules.value["cidr_blocks"]
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