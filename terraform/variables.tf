variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "az" {
  default = "us-east-1a"
}

variable "ami_id" {
  default = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "test-key-pair"
}
