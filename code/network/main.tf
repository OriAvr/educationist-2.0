module "my_vpc" {
  source = "../../modules/network"
  name   = var.name
  cidr   = var.cidr

  azs              = var.azs
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  flow_logs_bucket_arn   = ""

  s3_region = var.s3_region

  tags = var.tags
}
/*
module "my_s3_bucket" {
  source      = "../../../modules/data/s3"
  bucket_name = "educationist-flow-logs"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowAccessFromVPCOnly",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::educationist-flow-logs/*",
        "Condition" : {
          "StringEquals" : {
            "aws:SourceVpce" : "${module.my_vpc.vpc_id}"
          }
        }
      },
      {
        "Sid" : "DenyAccessFromOutsideVPC",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::educationist-flow-logs/*",
        "Condition" : {
          "StringNotEquals" : {
            "aws:SourceVpce" : "${module.my_vpc.vpc_id}"
          }
        }
      }
    ]
  })
}
*/
