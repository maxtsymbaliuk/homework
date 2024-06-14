name               = "tsymbaliukVPC"
vpc_cidr           = "10.0.0.0/16"
public_subnets_cidrs = ["10.0.1.0/24"]
private_subnets_cidrs = ["10.0.2.0/24"]
ami                = "ami-00beae93a2d981137"
instance_type      = "t2.micro"
key_name           = "MyKey"
region             = "us-east-1"
open_ports         = [22]

