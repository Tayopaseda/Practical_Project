resource "aws_subnet" "test-vm" {
  vpc_id = var.vpc_id
  cidr_block = var.test-vm-cidr
}

resource "aws_subnet" "rds-1" {
  vpc_id = var.vpc_id
  availability_zone = "eu-west-2a"
  cidr_block = var.rds-1-cidr
}

resource "aws_subnet" "rds-2" {
  vpc_id = var.vpc_id
  availability_zone = "eu-west-2b"
  cidr_block = var.rds-2-cidr
}
