variable "name" {}

variable "allowed_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "trusted_cidrs" {
  type = list(string)
}

variable "public_access" {
  type = bool
}

variable "ssh_access" {
  type    = bool
  default = false
}

variable "mysql_access" {
  type    = bool
  default = false
}

variable "http_access" {
  type    = bool
  default = false
}

variable "https_access" {
  type    = bool
  default = false
}

variable "run_script" {
  type = bool
}

variable "user_data" {
  type    = string
  default = ""
}

variable "provisioned" {
  type = bool
}

variable "remote_commands" {
  type    = list(string)
  default = []
}

variable "ec2_ami_id" {
  type    = string
  default = "ami-051f8a213df8bc089"
}