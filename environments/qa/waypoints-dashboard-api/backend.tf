terraform {
  backend "s3" {
    bucket               = "waypoints-terraform-test"
    key                  = "waypoints-dashboard-api"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "sandbox"
  }
}