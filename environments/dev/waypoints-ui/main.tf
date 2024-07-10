module "ecs_instance" {
  source = "../../../modules/waypoints-ui"

  name          = "waypoints-ui"

  allowed_cidrs = [
    "0.0.0.0/0",
    "96.61.158.12/32"
  ]

  public = true
}