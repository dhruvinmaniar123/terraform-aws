terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

#Configure AWS Instance

resource "aws_instance" "my_ec2_demo" {
  ami           = "ami-0851b76e8b1bce90b" 
  instance_type = "t2.micro"

  tags = {
    Name = "My_interview_instance"
  }
}