# modules/EC2/outputs.tf

output "public_instance_ip" {
  value = aws_instance.maxtsymbaliuk_public_instance.public_ip
}

output "private_instance_ip" {
  value = aws_instance.maxtsymbaliuk_private_instance.private_ip
}

