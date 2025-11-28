terraform {
  required_version = ">= 1.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.23.0"
    }
  }
  cloud {
    organization = "cloud-infra-dev"
    workspaces {
      name    = "testing-terraform-cloud-private-module-registry" # Workspace with VCS driven Workflow
      project = "AWS-Cloud-IaC"
    }
  }
}
provider "aws" {
  region              = var.region
  allowed_account_ids = [var.aws_account_id]
}

module "s3" {
  source         = "app.terraform.io/cloud-infra-dev/s3/aws"
  version        = "0.1.1"
  s3_name_prefix = "374278-s3-bucket"
  enable_kms     = true
}
