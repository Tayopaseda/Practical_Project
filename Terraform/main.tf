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
}

module "route_table" {
  source = "./route_table"
  vpc_id = module.vpc.id
  test-vm-subnet = module.subnets.test-vm
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
}
