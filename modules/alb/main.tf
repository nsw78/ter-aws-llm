resource "aws_lb" "llm_alb" {
  name               = "llm-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids
}

# Target Groups para os serviços
resource "aws_lb_target_group" "llm_api_tg" {
  name        = "llm-api-tg"
  port        = 11434
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "grafana_tg" {
  name        = "grafana-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "prometheus_tg" {
  name        = "prometheus-tg"
  port        = 9090
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "alertmanager_tg" {
  name        = "alertmanager-tg"
  port        = 9093
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

# Listener na porta 80 e regras para cada path
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.llm_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.llm_api_tg.arn
  }
}

resource "aws_lb_listener_rule" "grafana_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.grafana_tg.arn
  }

  condition {
    path_pattern {
      values = ["/grafana*"]
    }
  }
}

resource "aws_lb_listener_rule" "prometheus_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prometheus_tg.arn
  }

  condition {
    path_pattern {
      values = ["/prometheus*"]
    }
  }
}

resource "aws_lb_listener_rule" "alertmanager_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 30

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alertmanager_tg.arn
  }

  condition {
    path_pattern {
      values = ["/alertmanager*"]
    }
  }
}
