# modules/EC2/variables.tf
variable "ec2_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key name for the EC2 instances"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "VPC security group IDs for the EC2 instances"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnet IDs for the EC2 instances"
  type        = list(string)
}

variable "ssh_private_key" {
  description = "Private SSH key to connect to EC2 instances"
  type        = string
}

