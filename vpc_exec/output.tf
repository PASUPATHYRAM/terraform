output "inst" {
  value = aws_instance.Instance[*].id

}

output "public_dns" {
  value = aws_instance.Instance[*].public_ip 

}