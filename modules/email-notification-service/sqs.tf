resource "aws_sqs_queue" "queue" {
  name = "${terraform.workspace}-${var.name}-queue"
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 4
  })
}

resource "aws_sqs_queue" "dlq" {
  name = "${terraform.workspace}-${var.name}-dlq"
}

resource "aws_sqs_queue_redrive_allow_policy" "terraform_queue_redrive_allow_policy" {
  queue_url = aws_sqs_queue.dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.queue.arn]
  })
}