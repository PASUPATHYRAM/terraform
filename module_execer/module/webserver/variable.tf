variable "cidr" {
  type        = string
  description = "Provide cidr block for vpc"

}

variable "subcidr" {
  type        = string
  description = "Provide subnet cidr block"

}

variable "ami" {
  type        = string
  description = "provide ami"

}

variable "itype" {
  type        = string
  description = "Provide instance type"


}

variable "instaname" {
  type        = string
  description = "Provide ec2 instance name"

}