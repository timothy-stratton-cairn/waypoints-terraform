terraform {
  backend "s3" {
    bucket               = "waypoints-terraform"
    key                  = "email-notification-service"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "testing"
  }
}