# define Credentials and region variable

variable "aws_region" {
  description = "define your region here."
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  description = "define aws access key here."
  type = string
  default = ""
  sensitive = true
}

variable "aws_secret_access_key" {
  description = "define your secret key here"
  type = string
  default = ""
  sensitive = true
}

variable "aws_instance_type" {
  description = "define your instance type"
  type = string
  default = "t3.micro"
}

variable "aws_key_name" {
  description = "define your key here"
  type = string
  default = "node1"
}