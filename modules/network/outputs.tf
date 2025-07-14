output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "security_group_id" {
  value = aws_security_group.llm_sg.id
}
