output "VPC" {
  value = aws_vpc.vpc-for-my-progect.id
}
output "Subnet-1" {
  value = aws_subnet.subnet-for-my-project.id
}
output "Internet-GW" {
  value = aws_internet_gateway.igw-for-my-project.id
}
output "Route-table" {
  value = aws_default_route_table.default-route-table.id
}
output "Security-group" {
  value = aws_security_group.sg-http80-https443-ssh22.id
}