output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.*.id
}


output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.*.public_ip
}

output "instance_subnets" {
  description = "Subnets of instances"
  value       = aws_instance.app_server.*.subnet_id

}

output "vpc" {
  description = "Describe of VPC"
  value       = aws_vpc.main.id

}
