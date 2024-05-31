output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.maxtsymbaliuk-ec2.public_ip
}
