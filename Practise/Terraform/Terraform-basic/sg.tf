resource "aws_security_group" "ec2" {
  name        = "maxtsymbaliuk-sg"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    cidr_blocks       = ["0.0.0.0/0"]
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
  }

  ingress {
    cidr_blocks       = ["0.0.0.0/0"]
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = local.tags
}

