resource "aws_security_group" "main" {
  name        = "${terraform.workspace}-${var.name}"
  description = "${upper(terraform.workspace)} ${var.name}"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "Permit HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = var.allowed_cidrs
  }
  ingress {
    description = "Permit HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = var.allowed_cidrs
  }
  ingress {
    description = "Permit HTTP traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    self        = true
  }
  ingress {
    description = "Permit HTTP traffic"
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "TCP"
    cidr_blocks = [data.aws_vpc.main.cidr_block]
  }
  egress {
    description = "Permit all Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}