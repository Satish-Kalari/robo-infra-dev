terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0" #AWS Provider version, not terraform
    }
  }
  #storeing terraform.tfstate in aws s3 bucket
  backend "s3" {
    bucket = "test-state-dev"
    key = "catalogue"
    region = "us-east-1"
    dynamodb_table = "test-locking-dev"    
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}