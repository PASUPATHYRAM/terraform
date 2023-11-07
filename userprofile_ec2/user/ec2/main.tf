terraform {
  required_providers {
    aws     = {

    source = "hashicorp/aws"
    version = "~>5.0"
  }
  
}
  required_version = "~>1.6"

}

provider "aws" {
  region = var.region

}

#creating IAM user

resource "aws_iam_user" "name" {
  name = var.iam_user_name

}

#creating group

resource "aws_iam_group" "group_name" {
  name = var.iam_group


}

#adding user to the group
resource "aws_iam_user_group_membership" "adding_member" {
  user   = aws_iam_user.name.name
  groups = [aws_iam_group.group_name.name]


}

#attaching existing policy

resource "aws_iam_group_policy_attachment" "attaching_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  group      = aws_iam_group.group_name.name

}


#creating ec2_instance

resource "aws_instance" "ec2" {
  instance_type        = var.type
  # iam_instance_profile = aws_iam_user.name.name
  ami                  = var.ami_id


}


