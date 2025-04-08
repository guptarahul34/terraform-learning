/* data "aws_ec2_instance_type_offerings" "type_offering_region" {
    for_each = toset(["us-east-1a", "us-east-1b"])
    filter {
        name   = "instance-type"
        values = ["t3.micro"]
    }

    filter {
        name   = "location"
        values = [each.key]
    }

    location_type = "availability-zone"
  //preferred_instance_types = ["t3.micro", "t2.micro"]
}


# Define output block for above offerning

output "ec2_instance_type_offering" {
  value = [for t in data.aws_ec2_instance_type_offerings.type_offering_region: t.instance_types]
}

*/