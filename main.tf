provider "aws" {
  region = "us-east-1"  # Substitua pela região desejada
}

resource "aws_security_group" "security_group_avaliatech" {
  name        = "security_group_avaliatech"
  description = "Security Group para SSH, HTTP e porta 8000"

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
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 8085
    to_port     = 8085
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 5290
    to_port     = 5290
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 1433
    to_port     = 1433
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

resource "aws_instance" "avaliatechback_vm" {
  ami           = "ami-053b0d53c279acc90"  # AMI do Ubuntu 18.04 (substitua pela AMI desejada)
  instance_type = "t2.medium"  # Tipo de instância (substitua pelo tipo desejado)
  key_name      = aws_key_pair.keypair_avaliatech.key_name

  vpc_security_group_ids = [aws_security_group.security_group_avaliatech.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y software-properties-common
              sudo apt-add-repository --yes --update ppa:ansible/ansible
              sudo apt-get install -y ansible

              # Copia a chave SSH para o diretório do usuário
              echo "${file("~/.ssh/id_rsa.pub")}" >> ~/.ssh/authorized_keys
              chmod 600 ~/.ssh/authorized_keys
              EOF


  tags = {
    Name        = "avaliatechback_vm"
    Environment = "dev"
    Application = "backend"
    Class       = "DevOps"
    Origem      = "hackweek"
  }
}

resource "aws_instance" "avaliatechfront_vm" {
  ami           = "ami-053b0d53c279acc90"  # AMI do Ubuntu 18.04 (substitua pela AMI desejada)
  instance_type = "t2.medium"  # Tipo de instância (substitua pelo tipo desejado)
  key_name      = aws_key_pair.keypair_avaliatech.key_name

  vpc_security_group_ids = [aws_security_group.security_group_avaliatech.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y software-properties-common
              sudo apt-add-repository --yes --update ppa:ansible/ansible
              sudo apt-get install -y ansible

              # Copia a chave SSH para o diretório do usuário
              echo "${file("~/.ssh/id_rsa.pub")}" >> ~/.ssh/authorized_keys
              chmod 600 ~/.ssh/authorized_keys
              EOF


  tags = {
    Name        = "avaliatechfront_vm"
    Environment = "dev"
    Application = "backend"
    Class       = "DevOps"
    Origem      = "hackweek"
  }  

}

resource "aws_instance" "avaliatechdevops_vm" {
  ami           = "ami-053b0d53c279acc90"  # AMI do Ubuntu 18.04 (substitua pela AMI desejada)
  instance_type = "t2.medium"  # Tipo de instância (substitua pelo tipo desejado)
  key_name      = aws_key_pair.keypair_avaliatech.key_name

  vpc_security_group_ids = [aws_security_group.security_group_avaliatech.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y software-properties-common
              sudo apt-add-repository --yes --update ppa:ansible/ansible
              sudo apt-get install -y ansible

              # Copia a chave SSH para o diretório do usuário
              echo "${file("~/.ssh/id_rsa.pub")}" >> ~/.ssh/authorized_keys
              chmod 600 ~/.ssh/authorized_keys
              EOF


  tags = {
    Name        = "avaliatechdevops_vm"
    Environment = "dev"
    Application = "backend"
    Class       = "DevOps"
    Origem      = "hackweek"
  }  

}
# resource "aws_eip" "avaliatechfront_vm" {
#   instance = aws_instance.avaliatechfront_vm.id  
# }

resource "aws_eip" "avaliatechback_vm" {
  instance = aws_instance.avaliatechback_vm.id  
}
