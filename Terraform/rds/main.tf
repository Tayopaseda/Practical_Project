resource "aws_db_subnet_group" "rds" {
  name = "rds-subnet-group"
  subent_ids = [var.rds-sub-1, var.rds-sub-2]
  
  tags = {
    name = "database subnet group"
  }
}

resource "aws_db_instance" "test-db" {
  allocated_storage = 20
  engine = "mysql"
  instance_class = "db.t2.micro"
  name = "testdb"
  username = var.username
  password = var.password
  db_subnet_group_name = aws_db_subnet_group.rds.id
  vpc_security_group_ids = [var.test-db-sg]
  skip_final_snapshot = true
}

