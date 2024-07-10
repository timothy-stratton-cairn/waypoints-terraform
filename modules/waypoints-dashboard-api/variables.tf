variable "name" {
  default = "waypoints-dashboard-api"
}

variable "cpu" {
  default = 512
}

variable "memory" {
  default = 1024
}

variable "container_port" {
  default = 8080
}

variable "deregistration_delay" {
  default = 300
}

variable "allowed_cidrs" {
  default = ["0.0.0.0/0"]
}

variable "trusted_cidrs" {
  default = ["0.0.0.0/0"]
}

variable "public" {
  default     = true
  description = "If true, the load balancer is deployed to the public subnet."
}

variable "ecs_as_cpu_low_threshold_per" {
  default     = "20"
  description = "Scale num containers down when threshold is below this threshold"
}

variable "ecs_as_cpu_high_threshold_per" {
  default     = "80"
  description = "Scale num containers up when threshold is above this threshold"
}

variable "ecs_autoscale_min_instances" {
  default = "1"
}

variable "ecs_autoscale_max_instances" {
  default = "1"
}

variable "db_name" {
  default = "dashboard"
}

locals {
  image = "${data.aws_ecr_repository.repository.repository_url}:${data.aws_ssm_parameter.version.value}"

  secrets = concat([
    { name = "DB_USERNAME", valueFrom = data.aws_ssm_parameter.DB_USERNAME.arn },
    { name = "DB_PASSWORD", valueFrom = data.aws_ssm_parameter.DB_PASSWORD.arn }
  ],
    [for i, arn in data.aws_ssm_parameters_by_path.app.arns :
      {
        name: basename(data.aws_ssm_parameters_by_path.app.names[i]), valueFrom: arn
      }]
  )

  environment_variables = [
    { name = "SPRING_PROFILES_ACTIVE", value = terraform.workspace },
    { name = "DB_CONNECTION", value = "jdbc:mysql://${data.aws_ssm_parameter.DB_URL.value}:3306/${var.db_name}?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC&createDatabaseIfNotExist=true" }
  ]
}

data "aws_ssm_parameter" "DB_URL" {
  name = "/${terraform.workspace}/${var.db_name}/DB_URL"
}

data "aws_ssm_parameter" "DB_USERNAME" {
  name = "/${terraform.workspace}/${var.db_name}/DB_USERNAME"
}

data "aws_ssm_parameter" "DB_PASSWORD" {
  name = "/${terraform.workspace}/${var.db_name}/DB_PASSWORD"
}

data "aws_ssm_parameters_by_path" "app" {
  path = "/${terraform.workspace}/${var.name}"
}

data "aws_ssm_parameter" "version" {
  name = "/${terraform.workspace}/${var.name}/VERSION"
}

data "aws_ecr_repository" "repository" {
  name = "waypoints-dashboard-api"
}
