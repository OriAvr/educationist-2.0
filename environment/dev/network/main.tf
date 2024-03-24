module "my_vpc" {
  source = "../../../modules/network"
  name   = var.name
  cidr   = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  flow_logs_bucket_arn   = var.flow_logs_bucket_arn

  tags = var.tags
}


/*
module "my_vpc" {
  source                = "../../../modules/network"
  s3_region             = var.s3_region
  azs                   = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  flow_logs_bucket_name = var.flow_logs_bucket_name
}
*/

