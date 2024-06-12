# variables.tf

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "owner" {
  description = "Owner of the infrastructure"
  type        = string
}

variable "created_by" {
  description = "Creator of the infrastructure"
  type        = string
}

variable "purpose" {
  description = "Purpose of the infrastructure"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "ssh_key_path" {
  description = "Path to your public SSH key"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to your private SSH key"
  type        = string
}

variable "ec2_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 3
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-08a0d1e16fc3f61ea"  # Update this to a valid AMI ID for your region
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}
