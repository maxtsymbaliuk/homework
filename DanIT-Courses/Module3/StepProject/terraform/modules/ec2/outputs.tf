# modules/EC2/outputs.tf
output "public_ips" {
  value = [for instance in aws_instance.ec2-step : instance.public_ip]
}

