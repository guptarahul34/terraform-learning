terraform {
  required_version = "1.11.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.94.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}