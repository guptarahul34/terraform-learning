module "custome_vpc_terraform" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"
  
  # Define VPC Name here (VPC Setting)
  name = var.vpc_name
  cidr = var.vpc_cidr

  azs = var.azs_name
  private_subnets = var.private_subnet_cidr
  public_subnets  = var.public_subnet_cidr

  private_subnet_names = var.private_subnet_names
  public_subnet_names = var.public_subnet_names

  # define database subnet
  create_database_subnet_group = false
  create_database_subnet_route_table= var.create_database_subnet_route_table
  database_subnets = var.database_subnets
  database_subnet_names  = var.database_subnet_names

  enable_dns_hostnames = true
  enable_dns_support = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  private_subnet_tags = {
    Name = "Private Subnets"
  }

  public_subnet_tags = {
    Name = "Public Subnets"
  }

  tags = local.common_tags
  vpc_tags = local.common_tags

}