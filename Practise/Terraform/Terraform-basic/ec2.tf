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


resource "aws_instance" "app_server" {

  ami           = data.aws_ami.al2.id

  count         = var.size

  instance_type = var.instance_type

  key_name      = var.key_name

  subnet_id     = aws_subnet.public[count.index].id

  associate_public_ip_address = true

  vpc_security_group_ids = [ aws_security_group.ec2.id ]

  tags = local.tags 
  
  user_data = file("${path.module}/scripts/script.sh") 
}

