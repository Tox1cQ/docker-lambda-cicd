terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.16.0"

  backend "s3" {
    bucket = "tushar-terraform-state-556957333990"
    key    = "docker-lambda-cicd/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}
