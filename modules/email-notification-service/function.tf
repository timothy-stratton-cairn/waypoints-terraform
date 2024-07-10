locals {
  lambda_payload_filename = "../../../resources/waypoint-email-service-1.0-SNAPSHOT.jar"
}

resource "aws_lambda_function" "lambda" {
  filename      = local.lambda_payload_filename
  function_name = "${upper(terraform.workspace)}-${var.name}"
  role          = aws_iam_role.lambda.arn
  handler       = var.handler
  timeout       = 15
  memory_size   = 512

  source_code_hash = base64sha256(filebase64(local.lambda_payload_filename))

  runtime = "java17"

  tags = {
    Name = "${upper(terraform.workspace)}-${var.name} Lambda Function"
  }
}

resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  event_source_arn = aws_sqs_queue.queue.arn
  enabled          = true
  function_name    = aws_lambda_function.lambda.arn
  batch_size       = 10
}