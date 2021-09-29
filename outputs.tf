output "Latest-AMZ-Linux-AMI" {
  value = data.aws_ami.latest_amazon_linux_2_ami.id
}