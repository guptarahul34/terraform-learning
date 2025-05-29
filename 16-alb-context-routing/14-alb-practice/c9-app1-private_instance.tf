module "app1_private_instance" {
  depends_on = [ module.my_vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  ami                    = data.aws_ami.amalinux.id
  instance_type          = var.instance_type # used to set core count below
  subnet_id              = module.my_vpc.private_subnets
  vpc_security_group_ids = [ module.private_security_group.security_group_id ]
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.key_name
#   create_eip  = true

  tags = local.common_tags

}

