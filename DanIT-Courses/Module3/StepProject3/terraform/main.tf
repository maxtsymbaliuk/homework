# Step_Project_3/terraform/main.tf

module "vpc" {
  source  = "./modules/vpc"
  name    = var.name
  cidr    = var.vpc_cidr
  azs     = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
}

module "security_group" {
  source = "./modules/security_group"
  name   = var.name
  vpc_id = module.vpc.vpc_id

  prometheus_port    = var.prometheus_port
  grafana_port       = var.grafana_port
  node_exporter_port = var.node_exporter_port
  cadvisor_port      = var.cadvisor_port
}

module "ec2" {
  source              = "./modules/ec2"
  name                = var.name
  instance_count      = var.instance_count
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_ids          = module.vpc.public_subnets
  ansible_user        = var.ansible_user
  ansible_port        = var.ansible_port
  private_key         = var.private_key
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  name                = var.name
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.public_subnets
  security_group_id   = module.security_group.security_group_id
  instance_ids        = [module.ec2.instance_ids[0]]
}

resource "null_resource" "cleanup_inventory" {
  provisioner "local-exec" {
    command = "rm -f ../ansible/inventory.ini"
  }
}

resource "local_file" "inventory" {
  depends_on = [null_resource.cleanup_inventory]

  content = templatefile("${path.module}/inventory.tpl", {
    public_ips       = module.ec2.public_ips,
    ansible_user     = var.ansible_user,
    ansible_port     = var.ansible_port,
    private_key      = var.private_key,
    prometheus_port  = var.prometheus_port,
    grafana_port     = var.grafana_port,
    node_exporter_port = var.node_exporter_port,
    cadvisor_port    = var.cadvisor_port
  })
  filename = "${path.module}/../ansible/inventory.ini"
}

resource "null_resource" "wait_for_ssh" {
  count = length(module.ec2.public_ips)

  provisioner "local-exec" {
    command = <<EOT
    for i in {1..30}; do
      nc -zv ${element(module.ec2.public_ips, count.index)} 22 && break
      echo "Waiting for SSH to be available on ${element(module.ec2.public_ips, count.index)}..."
      sleep 5
    done
    EOT
  }
}

resource "null_resource" "ansible_playbook" {
  depends_on = [
    module.ec2,
    null_resource.wait_for_ssh
  ]

  provisioner "local-exec" {
    command = <<EOT
    ANSIBLE_CONFIG=${path.module}/../ansible/ansible.cfg \
    ansible-playbook -i ${path.module}/../ansible/inventory.ini \
    ${path.module}/../ansible/playbooks/deploy.yml
    EOT
  }
}

output "api_endpoints" {
  value = {
    prometheus = "http://${element(module.ec2.public_ips, 0)}:${var.prometheus_port}"
    grafana = "http://${element(module.ec2.public_ips, 0)}:${var.grafana_port}"
    cadvisor_1 = "http://${element(module.ec2.public_ips, 0)}:${var.cadvisor_port}"
    cadvisor_2 = "http://${element(module.ec2.public_ips, 2)}:${var.cadvisor_port}"
    node_exporter_1 = "http://${element(module.ec2.public_ips, 0)}:${var.node_exporter_port}"
    node_exporter_2 = "http://${element(module.ec2.public_ips, 1)}:${var.node_exporter_port}"
    node_exporter_3 = "http://${element(module.ec2.public_ips, 2)}:${var.node_exporter_port}"
  }
}





