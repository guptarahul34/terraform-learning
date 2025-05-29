# Find a certificate issued by (not imported into) ACM
data "aws_acm_certificate" "amazon_issued" {
  domain      = "*.argroup.store"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

#aws_acm_certificate.amazon_issued.arn
