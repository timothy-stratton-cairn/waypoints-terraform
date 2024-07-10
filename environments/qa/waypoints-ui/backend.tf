terraform {
  backend "s3" {
    bucket               = "waypoints-terraform-test-1"
    key                  = "waypoints-ui"
    region               = "us-east-1"
    workspace_key_prefix = "waypoints"
    profile              = "sandbox"
  }
}