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


output "az_lists" {
  value = [for t in data.aws_ec2_instance_type_offerings.ec2_type_offering: t.locations]
}

output "az_lists_v2" {
  value = keys({for az, insta in data.aws_ec2_instance_type_offerings.ec2_type_offering: az => insta.locations if length(insta.locations) > 0 })
}