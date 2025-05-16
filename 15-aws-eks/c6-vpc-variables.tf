variable "aws_vpc_name" {
  description = "Here we are defining VPC Name"
  type = string
}

variable "aws_vpc_cidr_block" {
  description = "Here we are defining VPC CIDR Block."
  type = string
}

variable "azs" {
  description = "define available azs"
  type = list(string)
}

variable "private_subnets" {
  description = "private subnet definitions."
  type = list(string)
}


variable "public_subnets" {
  description = "public subnets"
  type = list(string)
}