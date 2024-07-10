module "networking" {
  source = "../../../modules/infrastructure"
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