data "aws_ami" "al2" {
 most_recent = true

 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}


resource "aws_instance" "maxtsymbaliuk-ec2" {
  ami           = data.aws_ami.al2.id

  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = "MyKey"

  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                amazon-linux-extras install -y nginx1
                systemctl start nginx
                systemctl enable nginx
              EOF

  tags = {
    Name = "maxtsymbaliuk-web-server"
  }
}


