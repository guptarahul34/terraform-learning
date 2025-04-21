module "my_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr_block
}

