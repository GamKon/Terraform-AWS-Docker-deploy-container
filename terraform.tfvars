region_project_in               = "us-east-1"
az_project_in                   = "us-east-1a"

ip_for_ssh_inbound_connection   = "0.0.0.0/0"
#public_key_location             = "~/.ssh/key-for-ec2.pem"
public_key_location             = "~/.ssh/id_rsa.pub"
private_key_location            = "~/.ssh/id_rsa"
bootstrap_script_file           = "user_data.sh"
tfstate_s3_bucket               = "terraform-state-files-gamkon"

instance_type_webserver         = "t2.micro"
vpc_cidr_block                  = "192.168.0.0/16"
subnet_cidr_block               = "192.168.1.0/24"
env_prefix                      = "Dev"
project_name                    = "TF-AWS-Docker"
project_owner                   = "GamKon"
project_environment             = "Dev"


tags_common = {
    Owner   = "GamKon"
    Project = "TF-AWS-Docker"
    Environment = "Dev"
}
