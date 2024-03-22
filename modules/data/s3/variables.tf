variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block to allow bucket access from specific subnets."
  type        = string
}

variable "bucket_sse_alg" {
  description = "SSE algorithm to be used by the bucket."
  type        = string
}

variable "kms_key_deletion_window" {
  description = "The window for the KMS key to be deleted(in days)."
  type        = number
}
