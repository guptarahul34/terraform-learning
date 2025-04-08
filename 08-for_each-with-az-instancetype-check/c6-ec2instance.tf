resource "aws_instance" "dyanamic_azs" {
  ami = data.aws_ami.amalinux.id
  instance_type = var.aws_instance_type
  user_data = file("${path.module}/apache_script.sh")
  key_name = var.aws_key_name
  vpc_security_group_ids = [ aws_security_group.ssh_vpc.id ]
  for_each = toset(keys({for az, insta in data.aws_ec2_instance_type_offerings.ec2_type_offering: az => insta.locations if length(insta.locations) > 0 }))
  availability_zone = each.key
  tags = {
    Name = "${each.key}"
  }
}