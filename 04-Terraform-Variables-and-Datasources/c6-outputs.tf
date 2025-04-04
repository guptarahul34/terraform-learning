# define the output variables here 

output "instance_public_ip" {
  value = aws_instance.demo_ec2.public_ip
}

output "instance_public_dns_name" {
  value = aws_instance.demo_ec2.public_dns
}