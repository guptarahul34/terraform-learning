output "app1_public_ip" {
  value = module.app1_private_instance.public_ip
}

output "app2_public_dns" {
  value = module.app1_private_instance.public_dns
}
