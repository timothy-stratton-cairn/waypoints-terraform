terraform {
  backend "s3" {
    bucket               = "waypoints-terraform-test"
    key                  = "waypoints-dashboard-db"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "sandbox"
  }
}