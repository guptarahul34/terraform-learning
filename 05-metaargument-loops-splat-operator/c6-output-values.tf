# define your output values here 

output "instance_ip_with_list" {
  value = [for instance in aws_instance.demo: instance.public_dns]
}

# Print values with map 
output "instance_public_ip_with_map" {
  value = {for instance in aws_instance.demo: instance.id => instance.public_ip}
}

# print value with splat legacy operator

output "output_with_lagecy_splat_operator" {
  value = aws_instance.demo.*.public_dns
}


#print values with splat latest operator

output "output_with_latest_splat_operator" {
  value = aws_instance.demo[*].public_dns
}