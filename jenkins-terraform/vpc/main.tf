resource "aws_vpc" "vpc" {
  cidr_block = "22.15.0.0/16"
  tags = {
    name = "vpc"
  }
}


