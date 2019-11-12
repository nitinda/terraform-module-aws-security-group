resource "aws_security_group" "market_security_group" {
    name_prefix            = "${var.name_prefix}"
    description            = "${var.description}"
    vpc_id                 = "${var.vpc_id}"
    tags                   = "${var.common_tags}"
    revoke_rules_on_delete = "${var.revoke_rules_on_delete}"
    ingress                = ["${var.ingress}"]
    egress                 = ["${var.egress}"]

    lifecycle {
        create_before_destroy = true
    }
}