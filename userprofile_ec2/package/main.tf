provider "aws" {
  region = "us-east-2"

}

module "ec2_instace_iam_profile" {
  source        = "/home/ub/My_exec/userprofile_ec2/user/ec2"
  iam_user_name = "pasupathy"
  iam_group     = "ram"
  ami_id        = "ami-0fa399d9c130ec923"
  region        = "us-east-2"


}