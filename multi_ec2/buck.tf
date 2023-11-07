# resource "aws_s3_bucket" "example" {
#   bucket        = "my-unique-bucket"
#   force_destroy = true

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }