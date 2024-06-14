# modules/EC2/main.tf
resource "aws_instance" "ec2-step" {
  count         = var.ec2_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id                   = element(var.subnet_ids, count.index)
  associate_public_ip_address = true

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "ec2-instance-${count.index}"
  }
}

