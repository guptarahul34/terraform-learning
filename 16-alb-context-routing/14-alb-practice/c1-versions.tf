terraform {
  required_version = "1.11.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.4"
    }
  }
  backend "s3" {
    bucket = "terraform-state-practice-v3"
    key = "terraform.tfstate"
    region = "us-east-1"
    # DynamoDB table used for state locking and consistency
    dynamodb_table = "terraform-state-lock" 
    use_lockfile = true
    encrypt = true
  }
  
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}
