variable "region_project_in"              { default = "us-east-1" }
variable "az_project_in"                  { default = "us-east-1a" }
variable "vpc_cidr_block"                 { default = "192.168.0.0/16" }
variable "subnet_cidr_block"              { default = "192.168.1.0/24" }
variable "ip_for_ssh_inbound_connection"  { default = "0.0.0.0/0" }
variable "instance_type_webserver"        { default = "t2.micro" }
variable "env_prefix"                     { default = "Dev" }
variable "project_environment"            { default = "Dev"}
variable "project_name"                   { default = "Project" }
variable "project_owner"                  { default = "GamKon" }

variable "tags_common" {
  description = "Common tags for all resources"
  type = map
  default = {
    Owner   = "GamKon"
    Project = "Project"
    Environment = "Dev"
  }
}
