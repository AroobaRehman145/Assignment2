output "vpc_id" {
  value = aws_vpc.myapp-vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.myapp-subnet-1.id
}

# If you have a second subnet for private, use its resource name here
output "private_subnet_id" {
  value = aws_subnet.myapp-subnet-1.id 
}