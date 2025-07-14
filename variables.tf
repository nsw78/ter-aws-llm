variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "key_name" {
  default = "tfzombie"
}

variable "llm_model" {
  default = "mistral"
}

variable "ollama_port" {
  default = 11434
}

variable "install_grafana" {
  default = true
}

variable "install_prometheus" {
  default = true
}

variable "install_alertmanager" {
  default = true
}
