module "alb_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "alb-sg"
  description = "open http rule from 0.0.0.0/0 "
  vpc_id      = module.my_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0" ]
  ingress_rules       = [ "http-80-tcp", "https-443-tcp" ]
  egress_rules = [ "all-all" ]
  tags = local.common_tags
}
