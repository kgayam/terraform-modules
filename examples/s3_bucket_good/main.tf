terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "bucket" {
  source      = "../../modules/s3_bucket_good"
  bucket_name = "example-terraform-modules-test-bucket"
  tags        = { Environment = "test" }
}

output "bucket_arn" {
  description = "ARN of the example bucket."
  value       = module.bucket.bucket_arn
}
