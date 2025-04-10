# define your variables here 

variable "aws_region" {
  description = "define your region here"
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  description = "define your access key here."
  type = string
  default = ""
}

variable "aws_secret_access_key" {
  description = "define your secret access key"
  type = string
  default = ""
}