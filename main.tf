provider "aws" {
  region = var.region
}

module "network" {
  source       = "./modules/network"
  region       = var.region
  vpc_cidr     = var.vpc_cidr
  subnet_cidr_1 = "10.0.1.0/24"
  subnet_cidr_2 = "10.0.2.0/24"
}


module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = module.network.subnet_ids[0]    # pega a primeira subnet da lista
  security_group_id = module.network.security_group_id

  llm_model          = var.llm_model
  ollama_port        = var.ollama_port
  install_grafana    = var.install_grafana
  install_prometheus = var.install_prometheus
  install_alertmanager = var.install_alertmanager
}

module "alb" {
  source            = "./modules/alb"
  subnet_ids        = module.network.subnet_ids
  security_group_id = module.network.security_group_id
  vpc_id            = module.network.vpc_id
  
}

output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}
