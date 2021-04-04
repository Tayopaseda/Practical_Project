resource "aws_security_group" "test-vm" {
  vpc_id = var.vpc_id
  name = "test-vm-sg"
  description = "security group for test-vm"
  
  ingress {
    description = "allow inbound traffic on port 22 from jenkins"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["34.105.133.70/32"]
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
