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

resource "aws_iam_user" "users" {
  count = 3
  name  = "User_AWS_${count.index + 1}"
  tags = {
    Enviro = "Production"
  }

}

resource "aws_iam_group" "group" {
  name = "User_AWS_Group"

}

resource "aws_iam_group_policy" "group_policy" {
  name  = "production_policy"
  group = aws_iam_group.group.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })


}

resource "aws_iam_group_membership" "group_membership" {
  count = length(aws_iam_user.users)
  group = aws_iam_group.group.name
  users = [aws_iam_user.users[count.index].name]
  name  = "IAM_GROUP_ME"

}