locals {
  # Common tags to be assigned to all resources
  tags = {
    Name    = var.name
    Owner   = var.name
  }
}
