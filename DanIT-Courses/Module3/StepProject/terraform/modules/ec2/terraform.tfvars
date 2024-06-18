name                    = "ec2-step3"
instance_count          = "3"
ami_id                  = "ami-00beae93a2d981137"
instance_type           = "t2.micro"
key_name                = "MyKey"
private_key             = "/home/vagrant/.ssh/MyKey.pem"
ansible_user           = "ec2-user"
ansible_port           = 22
