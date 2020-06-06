terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = var.remote_state_location_region

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_s3_bucket" "remote_state_location" {

  bucket = var.remote_state_location_bucket

  tags = {
    project = var.project
    owner = var.user
  }

  # Enabling versioning to get full revision history of state files, if required
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}