/* data "aws_ec2_instance_type_offering" "type_offering_region" {
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = ["us-east-1b"]
  }

  location_type = "availability-zone"
  //preferred_instance_types = ["t3.micro", "t2.micro"]
}


# Define output block for above offerning

output "ec2_instance_type_offering" {
  value = data.aws_ec2_instance_type_offering.type_offering_region.instance_type
}
*/