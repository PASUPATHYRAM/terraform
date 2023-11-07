output "user_name" {
  description = "Listing User name"
  value       = aws_iam_user.users[*].id

}


output "user_unique_id" {
  description = "Listing User name"
  value       = aws_iam_user.users[*].unique_id

}