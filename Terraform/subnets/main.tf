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

resource "aws_subnet" "eks-cluster-1" {
  vpc_id = var.vpc_id
  availability_zone = "eu-west-2a"
  cidr_block = var.cluster-1
  map_public_ip_on_launch = true
  tags = {
    "kubernetes.io/cluster/app-cluster" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "eks-cluster-2" {
  vpc_id = var.vpc_id
  availability_zone = "eu-west-2b"
  cidr_block = var.cluster-2
  map_public_ip_on_launch = true
  tags = {
    "kubernetes.io/cluster/app-cluster" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "eks-cluster-3" {
  vpc_id = var.vpc_id
  availability_zone = "eu-west-2c"
  cidr_block = var.cluster-3
  map_public_ip_on_launch = true
  tags = {
    "kubernetes.io/cluster/app-cluster" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}
