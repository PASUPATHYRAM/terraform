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
  region = var.region

}

locals {
  inbound  = [80, 443,22]
  outbound = [80, 443,22]
}

resource "aws_security_group" "sg_test" {
  name        = var.security
  description = "Security group enabling http and https"

  dynamic "ingress" {
    for_each = local.inbound
    content {
      to_port     = ingress.value
      from_port   = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }


  }

  dynamic "egress" {
    for_each = local.outbound
    content {
      to_port     = egress.value
      from_port   = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}

resource "aws_instance" "test_instance" {
  ami             = "ami-01f48e1e4b60cb973"
  instance_type   = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_test.id]
  depends_on = [aws_security_group.sg_test]

  tags = {
    Name = "Test_Instance"
  }

}