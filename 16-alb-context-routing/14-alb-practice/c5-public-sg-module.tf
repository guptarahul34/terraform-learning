# module "public_security_group" {
#   source = "terraform-aws-modules/security-group/aws"
#   version = "5.3.0"

#   name        = "bastion-host-sg"
#   description = "open ssh rule from 0.0.0.0/0 "
#   vpc_id      = module.my_vpc.vpc_id

#   ingress_cidr_blocks = ["0.0.0.0/0" ]
#   ingress_rules       = [ "ssh-tcp", "http-80-tcp" ]
#   egress_rules = [ "all-all" ]
#   tags = local.common_tags
# }
