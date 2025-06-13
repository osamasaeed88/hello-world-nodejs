output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "sg_id" {
  value = aws_security_group.private_sg.id
}
