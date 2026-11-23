variable "bucket_name" {
  description = "Globally unique name of the S3 bucket."
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default     = {}
}
