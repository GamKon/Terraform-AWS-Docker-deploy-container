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
  value = aws_route_table.route-table-for-my-project.id
}