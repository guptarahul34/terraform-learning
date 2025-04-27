module "private_instance" {
  depends_on = [ module.my_vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  ami                    = data.aws_ami.amalinux.id
  instance_type          = var.instance_type # used to set core count below
  subnet_id              = module.my_vpc.private_subnets[0]
  vpc_security_group_ids = [ module.private_security_group.security_group_id ]
  user_data = file("${path.module}/apache_script.sh")
  key_name = var.key_name
  # create_eip  = true
  name = "private-EC2"

  tags = local.common_tags

}
