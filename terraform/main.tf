provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "sg_docker" {
  name        = "sg_docker"
  description = "Grupo de seguridad para una instancia con Docker"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
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

resource "aws_instance" "iaw_practica_14_docker" {
  ami             = var.instance_ami
  instance_type   = var.ram_instance
  security_groups = [aws_security_group.sg_docker.name]
  key_name        = var.key_file_name

  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "ip_elastica_docker" {
  instance = aws_instance.iaw_practica_14_docker.id
}

output "docker_eip" {
  value = aws_eip.ip_elastica_docker.public_ip
}
