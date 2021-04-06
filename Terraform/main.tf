provider "aws" {
    shared_credentials_file = "~/.aws/credentials"
    region = "eu-west-2"
}

module "vpc" {
  source = "./vpc"
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.id
}

module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.id
  test-vm-cidr = module.subnets.test-vm-cidr
  cluster-1-cidr = module.subnets.cluster-1-cidr
  cluster-2-cidr = module.subnets.cluster-2-cidr
  cluster-3-cidr = module.subnets.cluster-3-cidr
}

module "route_table" {
  source = "./route_table"
  vpc_id = module.vpc.id
  test-vm-subnet = module.subnets.test-vm
  cluster-subnet-1 = module.subnets.cluster-1
  cluster-subnet-2 = module.subnets.cluster-2
  cluster-subnet-3 = module.subnets.cluster-3
}

module "ec2" {
  source = "./ec2"
  test-vm-subnet = module.subnets.test-vm
  test-vm-sg = module.security_group.test-vm
}

module "rds" {
  source = "./rds"
  rds-sub-1 = module.subnets.rds-1
  rds-sub-2 = module.subnets.rds-2
  test-db-sg = module.security_group.test-db
  prod-db-sg = module.security_group.prod-db
}
