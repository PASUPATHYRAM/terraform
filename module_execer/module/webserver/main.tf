terraform {
  required_version = "~>1.6"
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr

}

resource "aws_subnet" "my_sub" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.subcidr

}

resource "aws_instance" "insta" {
  ami           = var.ami
  instance_type = var.itype
  subnet_id     = aws_subnet.my_sub.id

  tags = {
    Name = "${var.instaname} - webserver"
  }

}