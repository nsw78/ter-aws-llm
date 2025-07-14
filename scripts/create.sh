#!/bin/bash

YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

echo -e "${YELLOW}🔧 Inicializando Terraform...${NC}"
terraform init | tee create.log

echo -e "${YELLOW}🚀 Aplicando infraestrutura...${NC}"
terraform apply -auto-approve | tee -a create.log

if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Infraestrutura criada com sucesso.${NC}"
else
  echo -e "${RED}❌ Falha ao aplicar infraestrutura.${NC}"
fi
