module "eks_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr_block

  azs = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  map_public_ip_on_launch = true

  enable_dns_hostnames = true
  enable_dns_support = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    "Name"                                     = "public-subnet"
    # "map_public_ip_on_launch"                  = "true" # <-- This is the key part
  }

  tags = local.tags_name
}

