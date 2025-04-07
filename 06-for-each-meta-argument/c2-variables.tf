# Define your variables here 

variable "aws_region" {
  description = "This is the Region value for creating resources in the AWS"
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  description = "define your access keys here."
  type = string
  default = ""
}

variable "aws_secret_access_key" {
  description = "define your scret access keys here."
  type = string
  default = ""
}

variable "az_lists" {
  description = "Make the default AZ Lists."
  type = list(string)
  default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
}


variable "aws_instance_type" {
  description = "define your EC2 types here."
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "define your key name."
  type = string
  default = "node1"
}