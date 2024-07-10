data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = [terraform.workspace]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
  tags = {
    Network = "private"
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
  tags = {
    Network = "public"
  }
}

data "aws_kms_key" "main" {
  key_id = "alias/${terraform.workspace}_key"
}

data "aws_ecs_cluster" "main" {
  cluster_name = terraform.workspace
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}