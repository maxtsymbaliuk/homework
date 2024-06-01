variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "region"{
  description = "Region name"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Instance Name"
  type        = string
  default     = "maxtsymbalik-ec2"
}

variable "key_name" {
  description = "SSH key"
  type        = string
  default     = "MyKey"
}

variable "size" {
  description = "size of enviroment"
  type        = number
  default     = 2
}
