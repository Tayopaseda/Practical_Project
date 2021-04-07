resource "aws_security_group" "jenkins" {
  vpc_id = var.vpc_id
  name = "jenkins security group"
  description = "security group for jenkins-vm"
  
  ingress {
    description = "allow inbound traffic on port 22 from set up"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["34.105.133.70/32"]
  }

  egress {
    description = "allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "jenkins" {
  key_name = "jenkins-1"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "jenkins" {
  ami = "ami-096cb92bb3580c759"
  instance_type = "t2.micro"
  key_name = "jenkins-1"
  associate_public_ip_address = true
  subnet_id = var.jenkins-subnet
  security_groups = [aws_security_group.jenkins.id]
}
