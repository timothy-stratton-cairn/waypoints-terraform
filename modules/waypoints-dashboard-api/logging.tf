resource "aws_cloudwatch_log_group" "main" {
  name              = "/${terraform.workspace}/ecs/${var.name}"
  retention_in_days = 7
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.main.name
}