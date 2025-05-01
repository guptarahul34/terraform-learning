module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.2"
  
  name = local.name
  internal = false
  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "80"
      lb_protocol       = "http"
    }
  ]

  security_groups = [ module.clb_security_group.security_group_id ]
  subnets = module.my_vpc.public_subnets
  number_of_instances = length(module.private_instance)
  instances           = [ for instances in module.private_instance: instances.id ]

}