variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_1" {
  description = "CIDR block for subnet 1"
  type        = string
}

variable "subnet_cidr_2" {
  description = "CIDR block for subnet 2"
  type        = string
}
