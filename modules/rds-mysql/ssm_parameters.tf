resource "aws_ssm_parameter" "db_url" {
  name      = "/${terraform.workspace}/${var.db_name}/DB_URL"
  type      = "String"
  value     = aws_db_instance.rds_instance.address
}

resource "aws_ssm_parameter" "db_root_user" {
  name      = "/${terraform.workspace}/${var.db_name}/DB_USERNAME"
  type      = "String"
  value     = aws_db_instance.rds_instance.username
}

resource "aws_ssm_parameter" "db_root_password" {
  name      = "/${terraform.workspace}/${var.db_name}/DB_PASSWORD"
  type      = "SecureString"
  value     = random_string.password.result
}