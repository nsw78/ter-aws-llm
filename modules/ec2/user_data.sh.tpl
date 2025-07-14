#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y docker.io curl
sudo systemctl enable docker
sudo systemctl start docker

sleep 10

# Ollama
docker run -d --name ollama -p ${OLLAMA_PORT}:${OLLAMA_PORT} --restart unless-stopped ollama/ollama
sleep 15
curl http://localhost:${OLLAMA_PORT}/api/pull -d '{"name":"${LLM_MODEL}"}'

%{ if INSTALL_GRAFANA }
# Grafana
docker run -d --name=grafana -p 3000:3000 --restart unless-stopped grafana/grafana-oss
%{ endif }

%{ if INSTALL_PROMETHEUS }
# Prometheus
docker run -d --name=prometheus -p 9090:9090 --restart unless-stopped prom/prometheus
%{ endif }

%{ if INSTALL_ALERTMANAGER }
# Alertmanager
docker run -d --name=alertmanager -p 9093:9093 --restart unless-stopped prom/alertmanager
%{ endif }
