module "alb_terraform_practice" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.16.0"

  name = "terraform-lb"
  vpc_id  = module.my_vpc.vpc_id
  subnets = module.my_vpc.public_subnets
  internal        = false

  # To prevent from accidental deletion
  enable_deletion_protection = false
  security_groups = [ module.alb_security_group.security_group_id ]
  tags = local.common_tags
  listeners = {
    my-http-listener = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = "http-listeners"
      }
    }

    domain-mapping-https = {
      depends_on                  = data.aws_acm_certificate.amazon_issued
      port                        = 443
      protocol                    = "HTTPS"
      ssl_policy                  = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
      certificate_arn             = data.aws_acm_certificate.amazon_issued.arn
      # additional_certificate_arns = [module.wildcard_cert.acm_certificate_arn]

      forward = {
        target_group_key = "http-listeners"
      }
    }    
  }

  target_groups = {
    http-listeners = {
      create_attachment = false
      target_type = "instance"
      protocol                          = "HTTP"
      port                              = 80
      ip_address_type  = "ipv4"
      protocol_version = "HTTP1"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      depends_on = [module.private_instance]
      # target_id = var.rahul
    }
  }

    # ex-https = {
    #   port                        = 443
    #   protocol                    = "HTTPS"
    #   ssl_policy                  = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
    #   certificate_arn             = module.acm.acm_certificate_arn
    #   additional_certificate_arns = [module.wildcard_cert.acm_certificate_arn]

    #   forward = {
    #     target_group_key = "ex-instance"
    #   }

    # }

}

#Attach insatnce as target group in ALB module
resource "aws_lb_target_group_attachment" "http-listeners" {
  for_each = { for k,v in module.private_instance: k => v }
  target_group_arn = module.alb_terraform_practice.target_groups["http-listeners"].arn
  target_id        = each.value.id
  port             = 80
}

#output module.ec2 insatnce block for testing

output "output_http_listner" {
  value = { for k,v in module.private_instance: k => v }
}