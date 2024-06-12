# modules/security_group/variables.tf
variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "ingress" {
  description = "Ingress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress" {
  description = "Egress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
}

