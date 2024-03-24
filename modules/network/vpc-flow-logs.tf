/*module "my_s3_bucket" {
  source                  = "../data/s3"
  bucket_name             = var.flow_logs_bucket_name
  bucket_sse_alg          = var.bucket_sse_alg
  kms_key_deletion_window = var.kms_key_deletion_window
  private_subnet_cidr     = var.private_subnet_cidr
}

resource "aws_iam_role" "flow_log_role" {
  name = "flow_log_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_flow_log" "vpc_flow_log" {
  log_destination      = module.my_s3_bucket.bucket_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.this.id
}
*/
