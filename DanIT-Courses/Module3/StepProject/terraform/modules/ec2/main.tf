# modules/EC2/main.tf
resource "aws_instance" "this" {
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

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install docker -y",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = var.ssh_private_key
      host        = self.public_ip
    }
  }
}

