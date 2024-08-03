module "ecs_instance" {
  source = "../../../modules/waypoints-dashboard-api"

  name          = "wp-dashboard-api"

  allowed_cidrs = [
    "0.0.0.0/0",
    "96.61.158.12/32"
  ]

  public = true
}