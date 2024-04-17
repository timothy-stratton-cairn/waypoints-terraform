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

data "aws_subnet" "private_subnet" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
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

data "aws_subnet" "public_subnet" {
  for_each = toset(data.aws_subnets.public.ids)
  id       = each.value
}