provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias  = "northvirginia"
  region = "us-east-1"
}
