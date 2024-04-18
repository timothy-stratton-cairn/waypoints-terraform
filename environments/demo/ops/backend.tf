terraform {
  backend "s3" {
    bucket               = "waypoints-terraform"
    key                  = "infrastructure"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "deploy"
  }
}