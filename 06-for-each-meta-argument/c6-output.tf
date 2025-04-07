# Define your output variables here

output "aws_public_ip" {
  description = "Public Public IPs of servers."
  value =   toset([for instance in aws_instance.for_each_loop: instance.public_ip])
}

output "public_dns_name" {
  value = toset([for instance in aws_instance.for_each_loop: instance.public_dns])
}