output "public-ip" {
  value = aws_instance.test-vm.public_ip
}

output "private-ip" {
  value = aws_instance.test-vm.private_ip
}


