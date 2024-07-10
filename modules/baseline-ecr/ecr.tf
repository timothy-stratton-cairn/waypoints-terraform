resource "aws_ecr_repository" "main" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Stack = var.name
  }
}

resource "aws_ecr_lifecycle_policy" "main" {
  repository = aws_ecr_repository.main.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 250 versioned images"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["v"]
          countType     = "imageCountMoreThan"
          countNumber   = 250
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Keep last 30 build images"
        selection = {
          tagStatus     = "tagged"
          tagPrefixList = ["build"]
          countType     = "imageCountMoreThan"
          countNumber   = 30
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 3
        description  = "Expire untagged images older than 30 days"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 30
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}

resource "aws_ecr_repository_policy" "main" {
  repository = aws_ecr_repository.main.name
  policy = jsonencode(
    {
      Version = "2008-10-17"
      Statement = [
        {
          Sid    = "Internal Management"
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
          }
          Action = "*"
        },
        {
          Sid       = "Cross Account Pull Access"
          Effect    = "Allow"
          Principal = {
            AWS = formatlist("arn:aws:iam::%s:root", distinct(concat([
              data.aws_caller_identity.current.account_id], var.accounts_pull_access)))
          }
          Action = "*"
        },
        {
          Sid    = "Cross Account Push Access"
          Effect = "Allow"
          Principal = {
            AWS = formatlist("arn:aws:iam::%s:root", distinct(concat([data.aws_caller_identity.current.account_id], var.accounts_push_access)))
          }
          Action = "*"
        }
      ]
    }
  )
}

data "aws_caller_identity" "current" {}