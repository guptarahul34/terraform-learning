terraform {
  required_version = "1.11.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.95.0"
    }
  }
}


provider "aws" {
  region = ""
  access_key = ""
  secret_key = ""
}
