name                    = "maxtsymbaliuk"
aws_region              = "us-east-1"
instance_count          = "3"
ami_id                  = "ami-00beae93a2d981137"
instance_type           = "t2.micro"
key_name                = "MyKey"
vpc_azs                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_cidr                = "10.0.0.0/16"
vpc_private_subnets     = ["10.0.10.0/24","10.0.11.0/24","10.0.12.0/24"]
vpc_public_subnets      = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
enable_nat_gateway      = true
single_nat_gateway       = true
ansible_user           = "ec2-user"
ansible_port           = 22
private_key             = "/home/vagrant/.ssh/MyKey.pem"

