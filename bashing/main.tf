terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
  required_version = "~>1.6"
}

provider "aws" {
  region = "us-east-2"

}

resource "aws_instance" "bashing" {
  ami           = "ami-01f48e1e4b60cb973"
  instance_type = "t2.micro"

  tags = {
    Name = "Bashing_instance"
  }
}