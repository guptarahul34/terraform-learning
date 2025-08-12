terraform {
  required_version = "1.11.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = ""
    key = ""
    region = ""
    dynamodb_table = ""
    # use_lockfile = true
    encrypt = true
  }
}


provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}