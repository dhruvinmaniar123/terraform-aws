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

resource "aws_instance" "myinstance" {
  ami           = "ami-0851b76e8b1bce90b" #ap-south-1 
  instance_type = "t2.micro"

}
resource "aws_eip" "lb" {
  vpc      = true
}

output "myinstance" {
    value = aws_instance.myinstance
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myinstance.id
  allocation_id = aws_eip.lb.id
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tcp"
  description = "Allow TCP inbound traffic"

  ingress {
    description      = "TCP"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.lb.public_ip}/32"]
    #cidr_blocks      = ["aws_eip.lb.public_ip"/32]
  }


  tags = {
    Name = "allow_tls"
  }
}
