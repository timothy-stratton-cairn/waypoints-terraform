module "waypoints_db_rds_instance" {
  source = "../../../modules/rds-mysql"

  db_name = "dashboard"
}

output "cluster_port" {
  value = module.waypoints_db_rds_instance.cluster_port
}

output "master_username" {
  value = module.waypoints_db_rds_instance.master_username
}

output "master_password" {
  value     = module.waypoints_db_rds_instance.master_password
  sensitive = true
}

# The database name
output "database_name" {
  value = module.waypoints_db_rds_instance.database_name
}

output "db_url" {
  value = module.waypoints_db_rds_instance.db_url
}

