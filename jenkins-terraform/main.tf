provider "aws" {
    shared_credentials_file = "~/.aws/credentials"
    region = "eu-west-2"
}

module "vpc" {
  source = "./vpc"
}

module "subnets" {
  source = "./subnet"
  vpc_id = module.vpc.id
}

module "route_table" {
  source = "./route_table"
  vpc_id = module.vpc.id
  jenkins-subnet = module.subnets.id
}

module "ec2" {
  source = "./ec2"
  vpc_id = module.vpc.id
  jenkins-subnet = module.subnets.id
}
