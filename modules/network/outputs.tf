output "vpc_id" {
  value       = aws_vpc.coderco_vpc.id
  description = "The ID of the VPC"
}

output "subnet_id" {
  value       = aws_subnet.main.id
  description = "The ID of the subnet"
}

output "ec2_security_group_id" {
  value       = aws_security_group.ec2.id
  description = "The ID of the security group for EC2"
}
