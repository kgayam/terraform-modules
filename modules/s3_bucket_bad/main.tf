variable "unused" {}

locals {
  not_used = "x"
}

resource "aws_s3_bucket" "this" {
  bucket = "my-test-bucket-12345"
      tags = { Name = "bad" }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "public-read"
}

resource "aws_instance" "demo" {
  ami           = "ami-0123456789abcdef0"
  instance_type = "t2.superlarge"
}

# Uncomment the block below to make `terraform validate` fail too:
# output "oops" {
#   value = aws_s3_bucket.does_not_exist.id
# }
