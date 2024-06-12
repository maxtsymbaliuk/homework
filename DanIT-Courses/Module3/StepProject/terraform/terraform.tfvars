vpc_cidr          = "10.0.0.0/16"
key_name          = "MyKey"  # Replace with your actual key name
owner             = "tsymbaliuk"
created_by        = "Terraform"
purpose           = "step3"
aws_region        = "us-east-1"
ssh_key_path      = "/home/vagrant/.ssh/id_rsa.pub"
ssh_private_key_path = "/home/vagrant/.ssh/id_rsa"
ec2_count         = 3
ami               = "ami-08a0d1e16fc3f61ea"  # Replace with a valid AMI ID
instance_type     = "t2.micro"

