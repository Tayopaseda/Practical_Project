resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
}

resource "aws_route_table_association" {
  subnet_id = var.test-vm-subnet
  route_table_id = aws_route_table.public.id
}


  
