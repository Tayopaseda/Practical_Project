output "test-endpoint" {
  value = aws_db_instance.test-db.endpoint
}

output "test-address" {
  value = aws_db_instance.test-db.address
}

output "prod-endpoint" {
  value = aws_db_instance.prod-db.endpoint
}

output "prod-address" {
  value = aws_db_instance.prod-db.address
}

