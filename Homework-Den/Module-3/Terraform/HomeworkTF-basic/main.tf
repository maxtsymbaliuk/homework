module "maxtsymbaliuk-vpc" {
  source = "./modules/vpc"
}

module "maxtsymbaliuk-sg" {
  source     = "./modules/sg"
  vpc_id     = aws_vpc.maxtsymbaliuk-vpc.id
  open_ports = var.open_ports
}

module "maxtsymbaliuk-ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.maxtsymbaliuk-vpc.subnet_id
  security_group_id = module.maxtsymbaliuk-sg.security_group_id
}
