provider "aws" {
  region = "us-east-2"

}

module "webserver-ram" {
  source    = "/home/ub/My_exec/module_execer/module/webserver"
  cidr      = "10.0.0.0/16"
  subcidr   = "10.0.100.0/24"
  ami       = "ami-0fa399d9c130ec923"
  itype     = "t2.micro"
  instaname = "RAM_EC2"


}