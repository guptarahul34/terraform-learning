output "private_ec2_public_ip_basion" {
  value = [ for instances in module.app2_private_instance: instances.private_ip ]
}

output "private_ec2_public_dns_basion" {
  value = [ for instances in module.app2_private_instance: instances.private_dns ]
}