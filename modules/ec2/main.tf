resource "aws_instance" "llm_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  user_data = templatefile("${path.module}/user_data.sh.tpl", {
    LLM_MODEL         = var.llm_model
    OLLAMA_PORT       = var.ollama_port
    INSTALL_GRAFANA   = var.install_grafana
    INSTALL_PROMETHEUS = var.install_prometheus
    INSTALL_ALERTMANAGER = var.install_alertmanager
  })

  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Name = "llm-ec2"
  }
}

