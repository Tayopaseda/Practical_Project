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

