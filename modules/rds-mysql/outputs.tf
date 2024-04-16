# The RDS Cluster Identifier
output "cluster_id" {
  value = aws_rds_cluster.main.id
}

# The database port
output "cluster_port" {
  value = aws_rds_cluster.main.port
}

# The DNS address of the RDS instance
output "cluster_dns" {
  value = aws_rds_cluster.main.endpoint
}

# A read-only endpoint for the Aurora cluster, automatically load-balanced across replicas
output "cluster_dns_read_only" {
  value = aws_rds_cluster.main.reader_endpoint
}

# The database master username
output "master_username" {
  value = aws_rds_cluster.main.master_username
}

# The database master password
output "master_password" {
  value     = random_string.password.result
  sensitive = true
}

# The database name
output "database_name" {
  value = aws_rds_cluster.main.database_name
}