module "s3_bucket" {
  source = "github.com/terraform-aws-modules/terraform-aws-s3-bucket"

  bucket = var.bucket_name

  attach_policy = true
  policy        = var.policy

  versioning = {
    enabled = true
  }
}

