resource "aws_security_group" "test-vm" {
  vpc_id = var.vpc_id
  name = "test-vm-sg"
  description = "security group for test-vm"
  
  ingress {
    description = "allow inbound traffic on port 22 from jenkins"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["3.10.52.80/32"]
  }
  
  ingress {
    description = "allow inbound traffic from test db"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.test-db.id]
  }

  egress {
    description = "allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "test-db" {
  vpc_id = var.vpc_id
  name = "test-db-sg"
  description = "security group for test database"
  
  ingress {
    description = "allow inbound traffic from test-vm on port 3306"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [var.test-vm-cidr]
  }
} 

resource "aws_security_group" "prod-db" {
  vpc_id = var.vpc_id
  name = "prod-db-sg"
  description = "security group for prod database"

  ingress {
    description = "allow inbound traffic from test-vm on port 3306"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [var.test-vm-cidr]
  }

  ingress {
    description = "allow inbound traffic from eks cluster"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [var.cluster-1-cidr, var.cluster-2-cidr, var.cluster-3-cidr]
  }
}
