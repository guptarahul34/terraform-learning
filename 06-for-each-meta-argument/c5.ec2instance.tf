resource "aws_instance" "for_each_loop" {
  ami = data.aws_ami.amalinux.id
  for_each = toset(var.az_lists)
  instance_type = var.aws_instance_type
  user_data = file("${path.module}/apache_script.sh")
  vpc_security_group_ids = [ aws_security_group.ssh_vpc.id ]
  key_name = var.key_name
  availability_zone = each.key
  tags = {
    Name= "${each.key}"
  }
}