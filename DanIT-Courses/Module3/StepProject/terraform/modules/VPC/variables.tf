variable "name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "The availability zones for the subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "The private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "The public subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Single NAT gateway"
  type        = bool
}

variable "tags" {
  description = "Tags for the VPC"
  type        = map(string)
}

