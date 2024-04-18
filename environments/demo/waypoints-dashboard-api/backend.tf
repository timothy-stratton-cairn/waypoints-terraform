terraform {
  backend "s3" {
    bucket               = "waypoints-terraform"
    key                  = "waypoints-dashboard-api"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "deploy"
  }
}