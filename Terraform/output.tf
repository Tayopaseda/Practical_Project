output "test-db-endpoint" {
  value = module.rds.test-endpoint
}

output "test-vm-public-ip" {
  value = module.ec2.public-ip
}

output "test-db-address" {
  value = module.rds.test-address
}

output "prod-db-endpoint" {
  value = module.rds.prod-endpoint
}

output "prod-db-address" {
  value = module.rds.prod-address
}

output "vpc-id" {
  value = module.vpc.id
}

output "subnet-1" {
  value = module.subnets.cluster-1
}

output "subnet-2" {
  value = module.subnets.cluster-2
}

output "subnet-3" {
  value = module.subnets.cluster-3
}
