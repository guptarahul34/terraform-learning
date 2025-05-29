# Here we are going to define SG outputs

# Public SG outputs

# output "basion_sg_id" {
#   description = "This will display basion host SG ID."
#   value       = module.public_security_group.security_group_id
# }

# output "basion_security_group_vpc_id" {
#   description = "The VPC ID of public SG."
#   value       = module.public_security_group.security_group_vpc_id
# }

# output "basion_public_security_group_name" {
#   description = "The name of the security group"
#   value       = module.public_security_group.security_group_name
# }


# Public SG outputs

output "private_sg_id" {
  description = "This will display private SG ID."
  value       = module.private_security_group.security_group_id
}

output "private_security_group_vpc_id" {
  description = "The VPC ID of private SG."
  value       = module.private_security_group.security_group_vpc_id
}

output "private_public_security_group_name" {
  description = "The name of the privae security group"
  value       = module.private_security_group.security_group_name
}
