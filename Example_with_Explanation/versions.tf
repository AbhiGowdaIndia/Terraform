terraform {
  required_version = ">= 1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17.0"
    }
  }

  # Backend configuration for remote state in S3
  backend "s3" {
    bucket         = "s3_bucket_example_project"       # Name of your S3 bucket
    key            = "Example_With_Explanation/terraform.tfstate"  # Path inside S3 bucket
    region         = "ap-south-1"                      # AWS region
    dynamodb_table = "s3_backend_locking_table"                 # DynamoDB table for locking
  }
}