resource "aws_security_group" "rds_sg" {
  name        = "${terraform.workspace}_${var.db_name}_rds_private"
  description = "${upper(terraform.workspace)} Security Rules for the ${var.db_name} mysql cluster"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = [for subnet in data.aws_subnet.public_subnet : subnet.cidr_block]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  egress {
    description = "Permit all Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${lower(terraform.workspace)}_${lower(var.db_name)}_rds_private"
  }
}