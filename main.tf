terraform {
  backend "s3" {
    bucket  = "terraform-state-files-gamkon"
    key     = "Terraform-AWS-Docker-deploy-container/terraform.tfstate"
    region  = "us-east-1"
  }
}

resource "aws_key_pair" "ssh_key_ec2" {
  key_name = "ssh-key-ec2"
  public_key = file(var.public_key_location)
}

module "networking" {
  source                        = "./modules/networking"
  ports_to_open                 = var.ports_to_open
  ip_for_ssh_inbound_connection = var.ip_for_ssh_inbound_connection
  project_name                  = var.project_name
  project_environment           = var.project_environment
  tags_common                   = var.tags_common
  vpc_cidr_block                = var.vpc_cidr_block
  subnet_cidr_block             = var.subnet_cidr_block
  az_project_in                 = var.az_project_in
}
resource "aws_instance" "server-for-my-project" {
  ami                           = data.aws_ami.latest_amazon_linux_2_ami.id
  instance_type                 = var.instance_type_webserver
  availability_zone             = var.az_project_in
  vpc_security_group_ids        = [ module.networking.security_group.id ]
  subnet_id                     = module.networking.subnet_1.id
  associate_public_ip_address   = true
  key_name                      = aws_key_pair.ssh_key_ec2.key_name
  user_data                     = file(var.bootstrap_script_file)
  tags = merge ( var.tags_common, { Name : "${var.project_name}-${var.project_environment}-server-1" } )
}