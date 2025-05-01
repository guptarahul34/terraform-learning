module "clb_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "clb-sg"
  description = "open http rule from 0.0.0.0/0 "
  vpc_id      = module.my_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0" ]
  ingress_rules       = [ "http-80-tcp", "http-8080-tcp" ]
  egress_rules = [ "all-all" ]
  tags = local.common_tags
}
