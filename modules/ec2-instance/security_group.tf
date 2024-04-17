resource "aws_security_group" "ec2_sg" {
  name        = "${terraform.workspace}-${var.name}"
  description = "${upper(terraform.workspace)} ${var.name}"
  vpc_id      = data.aws_vpc.main.id
}

resource "aws_security_group_rule" "permit_https_traffic" {
  type              = "ingress"
  count             = var.https_access ? 1 : 0
  description       = "Permit HTTPS traffic"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = var.allowed_cidrs
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "permit_java_https_traffic" {
  type              = "ingress"
  count             = var.https_access ? 1 : 0
  description       = "Permit HTTPS traffic"
  from_port         = 8443
  to_port           = 8443
  protocol          = "TCP"
  cidr_blocks       = var.allowed_cidrs
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "permit_http_traffic" {
  type              = "ingress"
  count             = var.http_access ? 1 : 0
  description       = "Permit HTTP traffic"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = var.allowed_cidrs
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "permit_java_http_traffic" {
  type              = "ingress"
  count             = var.http_access ? 1 : 0
  description       = "Permit HTTP traffic"
  from_port         = 8080
  to_port           = 8080
  protocol          = "TCP"
  cidr_blocks       = var.allowed_cidrs
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "permit_mysql_traffic" {
  type              = "ingress"
  count             = var.mysql_access ? 1 : 0
  description       = "Permit MySQL traffic"
  from_port         = 3306
  to_port           = 3306
  protocol          = "TCP"
  cidr_blocks       = var.allowed_cidrs
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "permit_loopback_traffic" {
  type              = "ingress"
  description       = "Permit HTTP traffic"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  self              = true
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "permit_ssh_traffic" {
  type              = "ingress"
  count             = var.ssh_access ? 1 : 0
  description       = "Permit SSH traffic from outside the VPC"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = var.trusted_cidrs
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "permit_internal_ssh_traffic" {
  type              = "ingress"
  count             = var.ssh_access ? 0 : 1
  description       = "Permit SSH from within VPC"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = [for cidr_set in data.aws_subnet.public_subnet : cidr_set.cidr_block]
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "permit_egress_traffic" {
  type              = "egress"
  description       = "Permit all Outbound Traffic"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}

data "aws_subnet" "public_subnet" {
  for_each = toset(data.aws_subnets.public.ids)
  id       = each.value
}