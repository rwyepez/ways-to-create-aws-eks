output "public_subnet_ids" {
  value = aws_subnet.subnet_eks[*].id
}


