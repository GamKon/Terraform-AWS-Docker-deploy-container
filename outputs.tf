output "VPC" {
  value = module.networking.vpc.id
}
output "Subnet-1" {
  value = module.networking.subnet_1.id
}
output "Security-group" {
  value = module.networking.security_group.id
}
output "Server-1" {
  value = aws_instance.server-for-my-project.id
}
output "Server-1-public-IP" {
  value = aws_instance.server-for-my-project.public_ip
}
