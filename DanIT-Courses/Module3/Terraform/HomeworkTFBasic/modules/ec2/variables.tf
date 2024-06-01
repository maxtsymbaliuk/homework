variable "subnet_id" {
  description = "The ID of the subnet where the instance will be located"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}
