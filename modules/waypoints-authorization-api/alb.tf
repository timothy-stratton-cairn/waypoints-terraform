resource "aws_lb" "public" {
  count                      = var.public ? 1 : 0
  name                       = "${terraform.workspace}-${var.name}"
  internal                   = false
  security_groups            = [aws_security_group.main.id]
  subnets                    = data.aws_subnets.public.ids
  enable_deletion_protection = false
  idle_timeout               = 1200
}

####################
# If public = true, still create private tg (above),
# but then also create public tg below.
####################

resource "aws_lb_target_group" "public" {
  count                = var.public ? 1 : 0
  name                 = "${terraform.workspace}-${var.name}"
  port                 = var.container_port
  protocol             = "HTTP"
  vpc_id               = data.aws_vpc.main.id
  deregistration_delay = var.deregistration_delay
  slow_start           = 30
  target_type          = "ip"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 15
    interval            = 60
    path                = "/health"
    matcher             = "200"
  }

  stickiness {
    type            = "lb_cookie"
    enabled         = true
    cookie_duration = 86400
  }

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_lb_listener" "http_public" {
  count             = var.public ? 1 : 0
  load_balancer_arn = aws_lb.public[0].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.public.0.arn
    type             = "forward"
  }

  lifecycle {
    create_before_destroy = false
  }
}