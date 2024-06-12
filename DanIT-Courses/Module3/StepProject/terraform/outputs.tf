# outputs.tf
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "ec2_instance_public_ips" {
  value = module.ec2.public_ips
}

