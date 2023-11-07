terraform {
  required_providers {
    aws = {
      version = "~>5.0.0"
      source  = "hashicorp/aws"
    }
  }
  required_version = ">=1, <2"
}

provider "aws" {
  region = var.region

}

#VPC creation
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Ram_Private_VPC"
  }


}

#Gateway Creation
resource "aws_internet_gateway" "IGW2" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "IGW_RAM"
  }

}


#Subent creation
resource "aws_subnet" "my_sub" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"

}

resource "aws_eip" "eip" {
  
  count = 2

}

# #Gateway attachemtn to VPC
# resource "aws_internet_gateway_attachment" "IGW_attach2" {
#   vpc_id              = aws_vpc.my_vpc.id
#   internet_gateway_id = aws_internet_gateway.IGW2.id

#   depends_on = [ aws_vpc.my_vpc, aws_internet_gateway.IGW2]

# }


#Route table cretion for vpc (need vpc id and gw since this will connect vpc with gw)
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW2.id
  }

}

#route table association with subnet
resource "aws_route_table_association" "my_route_asso" {
  subnet_id      = aws_subnet.my_sub.id
  route_table_id = aws_route_table.route_table.id

}

#security Group creation(allowing SSH, https)

resource "aws_security_group" "my_instance_security" {
  name   = "security1"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_instance" "Instance" {
  count                       = 2
  ami                         = var.ami_id
  instance_type               = var.typ
  subnet_id                   = aws_subnet.my_sub.id
  vpc_security_group_ids      = [aws_security_group.my_instance_security.id]
  associate_public_ip_address = true


  tags = {
    Name = "my_ec2_instance-${count.index + 1}"
  }


}

resource "aws_eip_association" "eip_assoc" {
  count         = 2
  instance_id   = aws_instance.Instance[count.index].id
  allocation_id = aws_eip.eip[count.index].id
}