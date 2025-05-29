module "private_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "private-sg"
  description = "open ssh rule from public sg group (from basion SG group) "
  vpc_id      = module.my_vpc.vpc_id

  ingress_with_source_security_group_id  = [ 
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.alb_security_group.security_group_id
    } 
    ]
#   ingress_rules       = [ "ssh-tcp" ]
  egress_rules = [ "all-all" ]
  tags = local.common_tags
}
