terraform {
  required_version = "~> 1.11.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.93.0"
    }
  }
}


# provider name should be name which we define in the required_providers

provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

