output "rds-1" {
  value = aws_subnet.rds-1.id
}

output "rds-2" {
  value = aws_subnet.rds-2.id
}

output "test-vm" {
  value = aws_subnet.test-vm.id
}

output "test-vm-cidr" {
  value = var.test-vm-cidr
}
