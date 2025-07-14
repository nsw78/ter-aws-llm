#!/bin/bash

# Atualiza pacotes e instala Docker
sudo apt update -y
sudo apt install -y docker.io curl

# Habilita e inicia o Docker
sudo systemctl enable docker
sudo systemctl start docker

# Aguarda Docker estar pronto
sleep 10

# Lança o container do Ollama
docker run -d --name ollama -p 11434:11434 --restart unless-stopped ollama/ollama

# Aguarda o Ollama subir antes de dar pull no modelo
sleep 15
curl http://localhost:11434/api/pull -d '{"name":"mistral"}' || echo "⚠️ Pull do modelo falhou" >> /var/log/ollama.log

# Grafana
docker run -d --name=grafana -p 3000:3000 --restart unless-stopped grafana/grafana-oss

# Prometheus
docker run -d --name prometheus -p 9090:9090 --restart unless-stopped prom/prometheus

# Alertmanager
docker run -d --name alertmanager -p 9093:9093 --restart unless-stopped prom/alertmanager
