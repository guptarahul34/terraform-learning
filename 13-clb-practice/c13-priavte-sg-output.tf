output "private_ec2_public_ip_basion" {
  value = [ for instances in module.private_instance: instances.private_ip ]
}

output "private_ec2_public_dns_basion" {
  value = [ for instances in module.private_instance: instances.private_dns ]
}