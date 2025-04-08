data "aws_availability_zones" "aws_regions" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


data "aws_ec2_instance_type_offerings" "ec2_type_offering" {
  for_each = toset(data.aws_availability_zones.aws_regions.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}


# output "az_lists" {
#   value = data.aws_availability_zones.aws_regions.names
# }

output "az_lists" {
  value = [for az in data.aws_ec2_instance_type_offerings.ec2_type_offering: az.locations if length(az.locations) > 0]
}


output "az_lists_v1" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.ec2_type_offering: az => details.locations if length(details.locations) > 0
    }
}