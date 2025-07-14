<<<<<<< HEAD
# ter-aws-llm
=======
# 🚀 Terraform AWS LLM Stack

Este projeto provisiona:

- VPC, Subnet e Security Group
- EC2 rodando containers: API LLM, Grafana, Prometheus, Alertmanager
- Application Load Balancer com roteamento por path

## 🔧 Requisitos

- Terraform
- VS Code com AWS CLI configurado
- Chave SSH na AWS (`key_name`)

## ⚙️ Setup

```bash
terraform init
terraform apply -auto-approve
>>>>>>> 77c775f (feat: primeiro commit projeto terraform aws llm)
