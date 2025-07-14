resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "llm-vpc"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_1
  availability_zone = "${var.region}a"

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_2
  availability_zone = "${var.region}b"

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_security_group" "llm_sg" {
  name        = "llm-sg"
  description = "Security group for LLM stack"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "llm-sg"
  }
}
