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

output "cluster-1" {
  value = aws_subnet.eks-cluster-1.id
}

output "cluster-2" {
  value = aws_subnet.eks-cluster-2.id
}

output "cluster-3" {
  value = aws_subnet.eks-cluster-3.id
}

output "cluster-1-cidr" {
  value = var.cluster-1
}

output "cluster-2-cidr" {
  value = var.cluster-2
}

output "cluster-3-cidr" {
  value = var.cluster-3
}
