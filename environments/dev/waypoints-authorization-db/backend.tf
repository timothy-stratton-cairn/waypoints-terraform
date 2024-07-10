terraform {
  backend "s3" {
    bucket               = "waypoints-terraform"
    key                  = "waypoints-authorization-db"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "testing"
  }
}