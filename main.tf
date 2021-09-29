provider "aws" {
  region = var.region_project_in
}

terraform {
  backend "s3" {
    bucket  = "terraform-state-files-gamkon"
    key = "Terraform-AWS-Docker-deploy-container/terraform.tfstate"
    region = "us-east-1"
  }
}
