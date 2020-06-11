# Declare terraform version
terraform {
  required_version = ">= 0.12, < 0.13"
}

# Declare provider
provider "aws" {
  region = var.region

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

# Declare remote state file
terraform {
    backend "s3" {
        encrypt = true
        bucket = "mjolnir-cicd-terraform-remote-state-location"
        dynamodb_table = "mjolnir-cicd-terraform-state-lock-dynamo-collection"
        region = "us-east-1"
        key = "CICD/TERRAFORM/BIFROST_SETUP/bifrost_setup.tfstate"
    }
}

