output "public_ip_basion" {
  value = module.basion_host_instance.public_ip
}

output "public_dns_basion" {
  value = module.basion_host_instance.public_dns
}