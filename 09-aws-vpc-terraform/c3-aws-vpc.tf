module "custome-vpc-terraform" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"
  
  # Define VPC Name here (VPC Setting)
  name = "my-vpc-terraform"
  cidr = "10.0.0.0/16"

  azs = [ "us-east-1a", "us-east-1b" ]
  private_subnets = [ "10.0.1.0/24", "10.0.2.0/24" ]
  public_subnets  = [ "10.0.101.0/24", "10.0.102.0/24" ]

  private_subnet_names = [ "my-private-subnet-1", "my-private-subnet-2" ]
  public_subnet_names = [ "my-public-subnet-1", "my-public-subnet-2" ]

  # define database subnet
  create_database_subnet_group = false
  create_database_subnet_route_table= true
  database_subnets = [ "10.0.151.0/24", "10.0.152.0/24" ]
  database_subnet_names    = [ "database-subnet-1", "database-subnet-2" ]

  enable_dns_hostnames = true
  enable_dns_support = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  private_subnet_tags = {
    Name = "Private Subnets"
  }

  public_subnet_tags = {
    Name = "Public Subnets"
  }



}