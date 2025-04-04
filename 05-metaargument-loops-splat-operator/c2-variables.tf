# define your variables here

variable "aws_region" {
  description = "Define your region where you want to create resource."
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  description = "define access key"
  type = string
  default = ""
  sensitive = true
}

variable "aws_secret_access_key" {
  description = "define secret access key"
  type = string
  default = ""
  sensitive = true
}

# define your key pair name

variable "aws_key_name" {
  description = "define your key name which you have created already."
  type = string
  default = ""
}

# ec2 insatnce variable type -> lists

variable "aws_instance_type_list" {
  description = "defined variable type lists"
  type = list(string)
  default = [ "t2.micro", "t2.medium" ]
}

# ec2 insatnce variable type -> maps

variable "aws_instance_type_map" {
  description = "defined variable type maps"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "prod" = "t2.medium"
  }
}