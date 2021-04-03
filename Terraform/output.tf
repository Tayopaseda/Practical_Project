output "test-db-endpoint" {
  value = module.rds.endpoint
}

output "test-vm-public-ip" {
  value = module.ec2.public-ip
}

