# define your ouput blocks here to check public ip and DNS Name

# Display public DNS for all EC2

output "public_dns_name" {
  value = [ for instances in aws_instance.dyanamic_azs: instances.public_dns ]
}

output "public_ip_name" {
  value = [ for instances in aws_instance.dyanamic_azs: instances.public_ip ]
}
