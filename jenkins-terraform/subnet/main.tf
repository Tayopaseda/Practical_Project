resource "aws_subnet" "jenkins-subnet" {
  vpc_id = var.vpc_id
  cidr_block = "22.15.1.0/24"
}
