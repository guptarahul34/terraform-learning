# define variables for credentials and required var

variable "aws_region" {
  description = "define your region here."
  type = string
}

variable "aws_access_key" {
  description = "define your access key here."
  type = string
}

variable "aws_secret_access_key" {
  description = "define your access key here."
  type = string
}

variable "environment" {
  description = "set your environment here."
  type = string
}

variable "business_division" {
  description = "sefine business division here."
  type = string
}