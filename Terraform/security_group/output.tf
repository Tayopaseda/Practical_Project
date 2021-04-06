output "test-vm" {
  value = aws_security_group.test-vm.id
}

output "test-db" {
  value = aws_security_group.test-db.id
}

output "prod-db" {
  value = aws_security_group.prod-db.id
}
