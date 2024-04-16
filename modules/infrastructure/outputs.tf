output "vpc_id" {
  value = aws_vpc.main.id
}

output "cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "network_acl_id" {
  value = aws_vpc.main.default_network_acl_id
}