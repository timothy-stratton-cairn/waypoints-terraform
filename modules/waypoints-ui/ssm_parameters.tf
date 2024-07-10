resource "aws_ssm_parameter" "version" {
  name  = "/${terraform.workspace}/${var.name}/VERSION"
  type  = "String"
  value = "latest"
  overwrite = false
}