terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "kgayam-tfstate-372461493678"
    key          = "examples/s3_bucket/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "bucket" {
  source      = "../../modules/s3_bucket"
  bucket_name = "example-terraform-modules-372461493678"
  tags        = { Environment = "test" }
}

output "bucket_arn" {
  description = "ARN of the example bucket."
  value       = module.bucket.bucket_arn
}
