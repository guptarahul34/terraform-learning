resource "aws_instance" "demo" {
  count = 2
  ami = data.aws_ami.amalinux.id
  instance_type = var.aws_instance_type_list[0]
  user_data = file("${path.module}/apache_script.sh")
  key_name = var.aws_key_name
  vpc_security_group_ids = [ aws_security_group.ssh_vpc.id ]
  tags = {
    Name = "demo-${count.index}"
  }
}
