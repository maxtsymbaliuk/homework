name                  = "step3-vpc"
cird                  = "10.0.0.0/16"
azs                   = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_private_subnets     = ["10.0.10.0/24","10.0.11.0/24","10.0.12.0/24"]
vpc_public_subnets      = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
enable_nat_gateway    = "true"
single_nat_gateway    = "true"
