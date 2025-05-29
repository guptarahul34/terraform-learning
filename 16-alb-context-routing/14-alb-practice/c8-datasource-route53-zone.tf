data "aws_route53_zone" "custom_domain" {
  name         = "argroup.store"
  private_zone = false
}

output "hosted_zone_output" {
  value = data.aws_route53_zone.custom_domain.zone_id
}


