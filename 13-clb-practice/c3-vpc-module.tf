module "my_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr_block

  azs = [ "us-east-1a", "us-east-1b" ]
  private_subnets = [ "10.0.1.0/24", "10.0.2.0/24" ]
  public_subnets  = [ "10.0.101.0/24", "10.0.102.0/24" ]

  map_public_ip_on_launch = true

  enable_dns_hostnames = true
  enable_dns_support = true

  enable_nat_gateway = true
  single_nat_gateway = true

  private_subnet_tags = {
    Name = "Private Subnets"
  }

  public_subnet_tags = {
    "Name"                                     = "public-subnet"
    "map_public_ip_on_launch"                  = "true" # <-- This is the key part
  }

  tags = local.common_tags
}

