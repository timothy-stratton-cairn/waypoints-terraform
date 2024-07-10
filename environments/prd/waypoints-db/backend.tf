terraform {
  backend "s3" {
    bucket               = "waypoints-terraform-test-1"
    key                  = "waypoints-authorization-db"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "sandbox"
  }
}