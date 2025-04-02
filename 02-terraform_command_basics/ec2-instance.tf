# terraform setting block

terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}


# provider block 

provider "aws" {
    # profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}

# resource block to provision resources in the cloud

resource "aws_instance" "demo-terraform" {
    ami = "ami-071226ecf16aa7d96"
    instance_type = "t2.micro"

    tags = {
        Name = "terraform"
        Owner = "Rahul Gupta"
    }
}
