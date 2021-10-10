resource "aws_key_pair" "ssh_key_ec2" {
  key_name = "ssh-key-ec2"
  public_key = file(var.public_key_location)
}

resource "aws_instance" "server-for-my-project" {
  ami                           = data.aws_ami.latest_amazon_linux_2_ami.id
  instance_type                 = var.instance_type_webserver
  availability_zone             = var.az_project_in
  vpc_security_group_ids        = var.vpc_security_group_ids
  subnet_id                     = var.subnet_id
  associate_public_ip_address   = true
  key_name                      = aws_key_pair.ssh_key_ec2.key_name
  //user_data                     = file ("user_data.sh")
  user_data                     = file(var.bootstrap_script_file)
  tags = merge ( var.tags_common, { Name : "${var.project_name}-${var.project_environment}-server-1" } )
}