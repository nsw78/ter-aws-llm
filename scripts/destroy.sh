#!/bin/bash

YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

echo -e "${YELLOW}⚠️ Destruindo infraestrutura...${NC}"
terraform destroy -auto-approve | tee destroy.log

if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Infraestrutura destruída com sucesso.${NC}"
else
  echo -e "${RED}❌ Falha ao destruir infraestrutura.${NC}"
fi
