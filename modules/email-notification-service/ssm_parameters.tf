resource "aws_ssm_parameter" "sqs_queue_url" {
  name      = "/${terraform.workspace}/${var.name}/EMAIL_NOTIFICATION_QUEUE_URL"
  type      = "String"
  value     = aws_sqs_queue.queue.url
}