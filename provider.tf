terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "sonarqube-app-bck"
    region = "eu-west-2"
    key    = "sonarqube/dev/terraform.tfstate"
  }

}



# configure the AWS provider

provider "aws" {
  region = "eu-west-2"
  default_tags {

    tags = {
      BillingID = "Platform"
      Project   = "Sonarqube"
      terraform = true
    }
  }


}
