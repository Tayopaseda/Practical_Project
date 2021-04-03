resource "aws_key_pair" "jenkinsKey" {
  key_name = "jenkinsKey"
  public_key = var.public-key
}

resource "aws_instance" "test-vm" {
  ami = "ami-096cb92bb3580c759"
  instance_type = "t2.micro"
  key_name = "jenkinsKey"
  associate_public_ip_address = true
  subnet_id = var.test-vm-subnet
  security_groups = [var.test-vm-sg]
}
