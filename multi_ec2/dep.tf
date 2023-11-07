resource "aws_key_pair" "deployer" {
  public_key = file("/home/ub/ssh/aws.pub")
  key_name   = "public_key"
}