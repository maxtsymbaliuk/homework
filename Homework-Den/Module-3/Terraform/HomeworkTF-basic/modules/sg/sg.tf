resource "aws_security_group" "maxtsymbaliuk-sg" {
  name        = "maxtsymbaliuk-sg"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = local.tags
}

resource "aws_security_group_rule" "maxtsymbaliuk_ingress_rules" {
  count                    = length(var.open_ports)
  type                     = "ingress"
  from_port                = var.open_ports[count.index]
  to_port                  = var.open_ports[count.index]
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.maxtsymbaliuk-sg.id
}

resource "aws_security_group_rule" "maxtsymbaliuk_egress_rules" {
  count                    = length(var.open_ports)
  type                     = "egress"
  from_port                = var.open_ports[count.index]
  to_port                  = var.open_ports[count.index]
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.maxtsymbaliuk-sg.id
}
