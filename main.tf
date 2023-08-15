provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  count         = 1
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.ubuntu_subnet.id

  tags = {
    Name = "TF-Ubuntu-${count.index + 1}" 
  }
}

resource "aws_vpc" "common" {
  cidr_block = "172.20.0.0/16"
  tags = {
    Name = "TF-VPC"
  }
}

resource "aws_subnet" "ubuntu_subnet" {
  vpc_id            = aws_vpc.common.id
  cidr_block        = "172.20.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "TF-Subnet" 
  }
}

