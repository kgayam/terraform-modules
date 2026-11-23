resource "aws_s3_bucket" "this" {
  #checkov:skip=CKV_AWS_18:Access logging not needed for test buckets
  #checkov:skip=CKV_AWS_144:Cross-region replication not needed for test buckets
  #checkov:skip=CKV_AWS_145:SSE-S3 is sufficient for test buckets
  #checkov:skip=CKV2_AWS_61:Lifecycle rules not needed for test buckets
  #checkov:skip=CKV2_AWS_62:Event notifications not needed for test buckets
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
