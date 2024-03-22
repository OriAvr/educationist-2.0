module "my_vpc" {
  source                = "../../../modules/network"
  s3_region             = var.s3_region
  azs                   = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  flow_logs_bucket_name = var.flow_logs_bucket_name
}


