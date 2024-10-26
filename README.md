Repository: git@gitlab.com:lamtech-tooling/terraform/sonarqube-terraform.git
Description:
Provisioning AWS EC2 instances to deploy sonarqube.
Prerequisites:

Terraform version: ~>1.3.3

Provider:

Source = hashicorp/aws
Version = ~>4.0
Backend = S3 bucket

Installation:

Install Terraform.
Configure S3 bucket
Terraform configuration files.

Usage:

Run terraform init to initialize the project.
Run terraform plan to plan the resources.
Run terraform apply to create the resources.

Variables:


region: AWS region (required)

instance_type: EC2 instance types (default: t3.medium)
`

Outputs:


domain name: Web address of the created EC2 instance for contoller.

Accessing Sonarqube:

Enter https://sonarqube.techrite.org into your browser.
Enter the below credentials


username : admin
password: admin


Change the password to update your credentials.
