module "ecs_instance" {
  source = "../../../modules/waypoints-authorization-api"

  name          = "wp-authorization-api"

  allowed_cidrs = [
    "0.0.0.0/0",
    "96.61.158.12/32"
  ]

  public = true
}