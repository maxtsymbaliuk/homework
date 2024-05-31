variable "open_ports" {
  description = "List of ports to be opened"
  type        = list(number)
  default     = [80, 443, 22]
}
variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
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
