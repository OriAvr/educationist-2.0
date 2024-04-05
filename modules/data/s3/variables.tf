variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "policy" {
  description = "Bucket access control policy"
  type        = string
}
