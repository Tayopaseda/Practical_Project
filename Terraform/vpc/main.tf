resource "aws_vpc" "vpc" {
  cidr_block = var.id
  tags = {
    name = "vpc"
  }
}
