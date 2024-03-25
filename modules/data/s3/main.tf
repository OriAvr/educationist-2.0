module "s3_bucket" {
  source = "github.com/terraform-aws-modules/terraform-aws-s3-bucket"

  bucket = var.bucket_name

  attach_policy = true
  policy        = var.policy

  versioning = {
    enabled = true
  }
}


/*
#bucket resource definition
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

#bucket versioning enablement
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "my_key" {
  description             = "KMS key to encrypt the s3 objects."
  deletion_window_in_days = var.kms_key_deletion_window
}

#bucket encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.my_key.arn
      sse_algorithm     = var.bucket_sse_alg
    }
  }
}

#denying access to anyone other than the bucket owner
resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

*/

