variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the EC2 instance"
  type        = string
}

variable "llm_model" {
  description = "Nome do modelo LLM a ser puxado (ex: mistral, llama3)"
  type        = string
  default     = "mistral"
}

variable "ollama_port" {
  description = "Porta para expor o serviço do Ollama"
  type        = number
  default     = 11434
}

variable "install_grafana" {
  type        = bool
  default     = true
}

variable "install_prometheus" {
  type        = bool
  default     = true
}

variable "install_alertmanager" {
  type        = bool
  default     = true
}