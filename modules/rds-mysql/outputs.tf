output "cluster_port" {
  value = aws_db_instance.rds_instance.port
}

# The database master username
output "master_username" {
  value = aws_db_instance.rds_instance.username
}

# The database master password
output "master_password" {
  value     = random_string.password.result
  sensitive = true
}

# The database name
output "database_name" {
  value = aws_db_instance.rds_instance.db_name
}

output "db_url" {
  value = aws_db_instance.rds_instance.address
}