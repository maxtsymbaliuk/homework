provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "my-vpc"
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Owner      = var.owner
    CreatedBy  = var.created_by
    Purpose    = var.purpose
  }
}

module "security_group" {
  source = "./modules/security_group"

  vpc_id = module.vpc.vpc_id

  ingress = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]

  egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]

  tags = {
    Name = "allow_ssh"
  }
}

module "ec2" {
  source              = "./modules/ec2"
  ec2_count           = var.ec2_count
  ami                 = var.ami
  instance_type       = var.instance_type
  key_name            = var.key_name
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_ids          = module.vpc.public_subnets
  ssh_private_key     = file(var.ssh_private_key_path)
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.ssh_key_path)
}

