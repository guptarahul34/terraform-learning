terraform {
  required_version = "1.11.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.93.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.4"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}
