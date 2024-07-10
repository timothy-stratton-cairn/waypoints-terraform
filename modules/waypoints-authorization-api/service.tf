# reference task def with data look up to get the latest revision deployed outside of terraform
data "aws_ecs_task_definition" "main" {
  task_definition = aws_ecs_task_definition.main.family

  depends_on = [aws_ecs_task_definition.main]
}

resource "aws_ecs_service" "main" {
  name                               = var.name
  cluster                            = data.aws_ecs_cluster.main.arn
  task_definition                    = "${data.aws_ecs_task_definition.main.family}:${data.aws_ecs_task_definition.main.revision}"
  desired_count                      = var.ecs_autoscale_min_instances
  deployment_minimum_healthy_percent = 50
  propagate_tags                     = "SERVICE"
  launch_type                        = "FARGATE"
  enable_execute_command             = true

  load_balancer {
    target_group_arn = aws_lb_target_group.public.0.arn
    container_name   = var.name
    container_port   = var.container_port
  }

  dynamic "load_balancer" {
    for_each = var.public ? ["public"] : []
    content {
      target_group_arn = aws_lb_target_group.public.0.arn
      container_name   = var.name
      container_port   = var.container_port
    }
  }

  network_configuration {
    subnets          = data.aws_subnets.public.ids
    security_groups  = [aws_security_group.main.id]
    assign_public_ip = true
  }

  tags = {
    "ecs-deploy:secrets-prefix" = "/${terraform.workspace}/${var.name}:/${terraform.workspace}/${var.db_name}"
    # enable refresh secrets on ecs deploy - https://github.com/justmiles/ecs-deploy#configuration
    "ecs-deploy:refresh-secrets" = true
  }
}