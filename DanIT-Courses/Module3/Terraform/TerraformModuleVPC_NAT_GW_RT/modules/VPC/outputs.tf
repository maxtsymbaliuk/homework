# modules/VPC/outputs.tf

output "vpc_id" {
  value = aws_vpc.maxtsymbaliuk_vpc.id
}

output "public_subnets" {
  value = aws_subnet.maxtsymbaliuk_public_subnet.*.id
}

output "private_subnets" {
  value = aws_subnet.maxtsymbaliuk_private_subnet.*.id
}

output "public_subnet_names" {
  value = aws_subnet.maxtsymbaliuk_public_subnet[*].tags.Name
}

output "private_subnet_names" {
  value = aws_subnet.maxtsymbaliuk_private_subnet[*].tags.Name
}
