resource "aws_appautoscaling_target" "main" {
  service_namespace  = "ecs"
  resource_id        = "service/${data.aws_ecs_cluster.main.cluster_name}/${aws_ecs_service.main.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  max_capacity       = var.ecs_autoscale_max_instances
  min_capacity       = var.ecs_autoscale_min_instances
}


resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  alarm_name          = "${var.name}-${terraform.workspace}-CPU-Utilization-High-${var.ecs_as_cpu_high_threshold_per}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.ecs_as_cpu_high_threshold_per

  dimensions = {
    ClusterName = data.aws_ecs_cluster.main.cluster_name
    ServiceName = aws_ecs_service.main.name
  }

  alarm_actions = [aws_appautoscaling_policy.app_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_low" {
  alarm_name          = "${var.name}-${terraform.workspace}-CPU-Utilization-Low-${var.ecs_as_cpu_low_threshold_per}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.ecs_as_cpu_low_threshold_per

  dimensions = {
    ClusterName = data.aws_ecs_cluster.main.cluster_name
    ServiceName = aws_ecs_service.main.name
  }

  alarm_actions = [aws_appautoscaling_policy.app_down.arn]
}

resource "aws_appautoscaling_policy" "app_up" {
  name               = "app-scale-up"
  service_namespace  = aws_appautoscaling_target.main.service_namespace
  resource_id        = aws_appautoscaling_target.main.resource_id
  scalable_dimension = aws_appautoscaling_target.main.scalable_dimension

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 2
    }
  }
}

resource "aws_appautoscaling_policy" "app_down" {
  name               = "app-scale-down"
  service_namespace  = aws_appautoscaling_target.main.service_namespace
  resource_id        = aws_appautoscaling_target.main.resource_id
  scalable_dimension = aws_appautoscaling_target.main.scalable_dimension

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}