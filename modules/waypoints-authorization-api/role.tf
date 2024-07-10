data "aws_iam_policy_document" "task" {

  statement {
    actions = [
      "*",
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter",
    ]
    resources = ["arn:aws:ssm:*:*:parameter/*"]
  }
  statement {
    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:GenerateDataKey"
    ]
    resources = [data.aws_kms_key.main.arn]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = [
      "arn:aws:s3:::*"
    ]
  }
}

resource "aws_iam_policy" "task" {
  name   = "${terraform.workspace}-${var.name}"
  path   = "/"
  policy = data.aws_iam_policy_document.task.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "task" {
  name               = "${terraform.workspace}-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_instance_profile" "task" {
  name = "${terraform.workspace}-${var.name}"
  role = aws_iam_role.task.name
}

resource "aws_iam_role_policy_attachment" "task" {
  role       = aws_iam_role.task.name
  policy_arn = aws_iam_policy.task.arn
}
