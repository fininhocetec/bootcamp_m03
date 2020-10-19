provider "aws" {
  region     = "us-east-2"
}

resource "aws_security_group" "bootcamp-sg" {
  name = "bootcamp-sg"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }

  ingress {
    from_port   = 22
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "telemetria" {
  count = 3   
  ami = "ami-07efac79022b86107"
  instance_type = "t2.micro"
  key_name = "fininho-k8s"

  tags = {
    Name = "telemetria${count.index}"
    type = "docker"
  }
  security_groups = ["${aws_security_group.bootcamp-sg.name}"]
}