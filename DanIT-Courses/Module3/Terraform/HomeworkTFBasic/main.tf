module "maxtsymbaliuk_vpc" {
  source = "./modules/vpc"
}

module "maxtsymbaliuk_security_group" {
  source     = "./modules/security_group"
  vpc_id     = module.maxtsymbaliuk_vpc.vpc_id
  open_ports = var.open_ports
}

module "maxtsymbaliuk_ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.maxtsymbaliuk_vpc.subnet_id
  security_group_id = module.maxtsymbaliuk_security_group.security_group_id
}


