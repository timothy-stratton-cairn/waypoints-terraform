resource "random_string" "password" {
  length  = 16
}

resource "aws_db_instance" "rds_instance" {
  engine                 = "mysql"
  db_name                = var.db_name
  identifier             = "${terraform.workspace}-${var.db_name}"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  publicly_accessible    = false
  username               = var.db_username
  password               = random_string.password.result
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  tags = {
    Name = "${terraform.workspace} ${var.db_name} Aurora MySQL Instance"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "main"
  subnet_ids = [for subnet in data.aws_subnet.private_subnet : subnet.id]

  tags = {
    Name = "${terraform.workspace} ${var.db_name} DB Subnet Group"
  }
}