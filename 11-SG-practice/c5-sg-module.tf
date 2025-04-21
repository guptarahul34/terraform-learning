module "security-group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "custom-sg"
  description = "Security group which is used as an argument in complete-sg"
  vpc_id      = module.my_vpc.vpc_id

  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_rules       = [ "https-443-tcp", "http-80-tcp" ]
  egress_rules = [ "all-all" ]
}
