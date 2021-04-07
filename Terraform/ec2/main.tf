resource "aws_key_pair" "jenkins" {
  key_name = "jenkins"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "test-vm" {
  ami = "ami-096cb92bb3580c759"
  instance_type = "t2.micro"
  key_name = "jenkins"
  associate_public_ip_address = true
  subnet_id = var.test-vm-subnet
  security_groups = [var.test-vm-sg]
}
