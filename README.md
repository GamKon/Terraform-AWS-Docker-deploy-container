## Terraform-AWS-Docker-deploy-container
### Author: GamKon

Deploys EC2 with Apache Webserver and Nginx as a docker container<br>
I devided code in to modules to make it universal and flexible.<br>
Variables are used everywhere, nothing is hardcoded.<br>
Uses remote state in S3 bucket.<br>
Uses environment variables for authentification.

Command to run: 

***terraform init && terraform apply -auto-approve***
