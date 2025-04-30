output "private_ec2_public_ip_basion" {
  value = module.private_instance.private_ip
}

output "private_ec2_public_dns_basion" {
  value = module.private_instance.private_dns
}