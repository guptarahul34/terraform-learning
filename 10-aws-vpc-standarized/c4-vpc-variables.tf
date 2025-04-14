variable "vpc_name" {
  description = "define your VPC name here."
  type = string
  default = "my-vpc-terraform"
}


variable "vpc_cidr" {
  description = "define vpc CIDR rnage here"
  type = string
  default = "10.0.0.0/16"
}

variable "azs_name" {
  description = "define availability zone name here"
  type = list(string)
  default = [ "us-east-1a", "us-east-1b" ]
}

variable "private_subnet_cidr" {
  description = "private subenet cidr range"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "public_subnet_cidr" {
  description = "public subnet CIDR range."
  type = list(string)
  default = [ "10.0.101.0/24", "10.0.102.0/24" ]
}

variable "private_subnet_names" {
  description = "private subnet names here."
  type = list(string)
  default = [ "my-private-subnet-1", "my-private-subnet-2" ]
}

variable "public_subnet_names" {
  description = "public subnet names here."
  type = list(string)
  default = [ "my-public-subnet-1", "my-public-subnet-2" ]
}

variable "create_database_subnet_route_table" {
  description = "define db route table here"
  type = bool
  default = true
}

variable "database_subnets" {
  description = "define db subnet here"
  type = list(string)
  default = [ "10.0.151.0/24", "10.0.152.0/24" ]
}

variable "database_subnet_names" {
   description = "define db subnet name here"
   type = list(string)
   default = [ "database-subnet-1", "database-subnet-2" ]
}

variable "enable_nat_gateway" {
  description = "define NAT gateway here"
  type = bool
  default = true
}

variable "single_nat_gateway" {
  description = "define single NAT gateway here"
  type = bool
  default = true
}