module "networking" {
  source = "../../../modules/infrastructure"
}

module "ecr" {
  source = "../../../modules/baseline-ecr"

  for_each = toset(local.repos)

  name   = each.value

  accounts_pull_access = [
    "533267318562",
  ]

  accounts_push_access = [
    "533267318562",
  ]
}

locals {
  repos = [
    "waypoints-ui",
    "waypoints-authorization-api",
    "waypoints-dashboard-api",
  ]
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "cidr_block" {
  value = module.networking.cidr_block
}

output "network_acl_id" {
  value = module.networking.network_acl_id
}