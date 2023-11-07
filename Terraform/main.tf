terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }

  }
  required_version = "1.6.2"
}

provider "aws" {
  region = var.region

}

resource "aws_instance" "test_instance" {
  ami           = "ami-0fa399d9c130ec923"
  instance_type = var.inttype

  tags = {
    Name       = "test instance"
    Enviroment = "dev"
    Alts       = "ram",
    Created    = formatdate("YYYY_MM_DD", timestamp())
  }

}
