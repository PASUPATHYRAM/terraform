locals {
  inbound  = [22, 443]
  outbound = [22, 443]
}

resource "aws_security_group" "east_1_sg" {
  name        = "Security_east_1"
  description = "security group for east_1"

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

resource "aws_security_group" "east_2_sg" {
  name        = "Security_east_2"
  description = "security group for east_2"
  provider    = aws.northvirginia

  dynamic "ingress" {
    for_each = local.inbound
    content {
      to_port     = ingress.value
      from_port   = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/24"]
    }


  }

  dynamic "egress" {
    for_each = local.outbound
    content {
      to_port     = egress.value
      from_port   = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/24"]
    }
  }

}