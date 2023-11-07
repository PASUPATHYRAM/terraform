locals {
  account = ["Dave", "Mille", "Austin"]
  account_map = { for name in local.account : name => name }
}

resource "aws_iam_user" "iam_user" {
  for_each = local.account_map
  name     = each.value

  tags = {
    created_on=timestamp()
  }
}