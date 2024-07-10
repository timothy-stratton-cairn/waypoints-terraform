resource "aws_ecs_task_definition" "main" {
  family        = "${terraform.workspace}-${var.name}"
  task_role_arn = aws_iam_role.task.arn

  memory                   = var.memory
  cpu                      = var.cpu
  execution_role_arn       = aws_iam_role.task.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode([
    {
      essential         = true,
      name              = var.name,
      memory            = var.memory,
      memoryReservation = var.memory,
      portMappings = [
        {
          containerPort = var.container_port,
          protocol      = "tcp"
        }],
      environment = local.environment_variables
      secrets     = local.secrets
      image       = local.image,
      logConfiguration = {
        logDriver : "awslogs",
        options : {
          awslogs-group         = aws_cloudwatch_log_group.main.name,
          awslogs-region        = data.aws_region.current.name,
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}
