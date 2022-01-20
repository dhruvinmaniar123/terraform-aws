terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "*"
  secret_key = "*"
}

resource "aws_s3_bucket" "mys3" {
  bucket = "dhru-tf-bucket-maniar"
}

output "mys3bucket" {
    value = aws_s3_bucket.mys3.bucket_domain_name
}
