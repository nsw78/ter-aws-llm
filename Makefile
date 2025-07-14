# Variáveis
TERRAFORM = terraform

.PHONY: init validate plan apply destroy fmt clean

# Inicializar Terraform
init:
	$(TERRAFORM) init

# Validar a configuração do Terraform
validate:
	$(TERRAFORM) validate

# Verificar o plano de execução
plan:
	$(TERRAFORM) plan

# Aplicar as mudanças do Terraform
apply:
	$(TERRAFORM) apply

# Destruir recursos do Terraform
destroy:
	$(TERRAFORM) destroy

# Formatar código do Terraform
fmt:
	$(TERRAFORM) fmt -recursive

# Limpeza do estado
clean:
	rm -rf .terraform terraform.tfstate terraform.tfstate.* *.backup
