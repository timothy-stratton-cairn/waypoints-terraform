terraform {
  backend "s3" {
    bucket               = "waypoints-terraform-test"
    key                  = "email-notification-service"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "sandbox"
  }
}