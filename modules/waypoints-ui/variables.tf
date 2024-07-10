variable "name" {
  default = "waypoints-ui"
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

  secrets = [for i, arn in data.aws_ssm_parameters_by_path.app.arns :
    {
      name: basename(data.aws_ssm_parameters_by_path.app.names[i]), valueFrom: arn
    }]
}

data "aws_ssm_parameters_by_path" "app" {
  path = "/${terraform.workspace}/${var.name}"
}

data "aws_ssm_parameter" "version" {
  name = "/${terraform.workspace}/${var.name}/VERSION"
  depends_on = [aws_ssm_parameter.version]
}

data "aws_ecr_repository" "repository" {
  name = "waypoints-ui"
}
