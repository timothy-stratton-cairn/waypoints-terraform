resource "aws_cloudwatch_log_group" "aws_cli_log_group" {
  name              = "/aws/lambda/${upper(terraform.workspace)}-${var.name}"
  retention_in_days = 14

  tags = {
    Name = "${upper(terraform.workspace)}-${var.name} EC2 Instance"
  }
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF

  tags = {
    Name = "${upper(terraform.workspace)}-${var.name} EC2 Instance"
  }
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}