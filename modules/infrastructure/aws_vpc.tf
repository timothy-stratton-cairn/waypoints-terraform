###############################################################################
### VIRTUAL PRIVATE CLOUD                                                   ###
###############################################################################

# VIRTUAL PRIVATE CLOUD
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames

  tags = {
    Name = terraform.workspace
  }
}