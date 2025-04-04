variable "aws_region" {
  description = "This will provide the region where we want to provision resources."
  type = string
  default = "us-east-1"
}

# instance_type variable block
variable "instance_type" {
  description = "this will provide ec2 type"
  type = string
  default = "t2.micro"
}

# define your key block here
variable "key_name" {
  description = "define your key pair name here."
  type = string
  default = "node1"
}