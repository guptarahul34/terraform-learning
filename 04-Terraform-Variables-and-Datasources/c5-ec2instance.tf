resource "aws_instance" "demo_ec2" {
  ami = data.aws_ami.amalinux.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id]
  user_data = file("${path.module}/apache_script.sh")
  tags = {
    "Name" = "created from terraform"
  }
}