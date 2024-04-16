module "fad-athena-api" {
  source = "../../../modules/infrastructure"
}

output "vpc_id" {
  value = module.fad-athena-api.vpc_id
}

output "cidr_block" {
  value = module.fad-athena-api.cidr_block
}

output "network_acl_id" {
  value = module.fad-athena-api.network_acl_id
}