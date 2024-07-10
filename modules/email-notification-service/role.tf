data "aws_iam_policy_document" "lambda" {

  statement {
    effect = "Allow"

    actions = [
      "ses:*",
      "sqs:*",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:CreateLogGroup",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "lambda" {
  name   = "${terraform.workspace}-${var.name}"
  path   = "/"
  policy = data.aws_iam_policy_document.lambda.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    actions = [ "sts:AssumeRole" ]

    principals {
      type = "Service"
      identifiers = [ "lambda.amazonaws.com" ]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${terraform.workspace}-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_instance_profile" "lambda" {
  name = "${terraform.workspace}-${var.name}"
  role = aws_iam_role.lambda.name
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}