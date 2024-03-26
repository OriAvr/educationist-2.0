module "my_vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"
  name   = var.name
  cidr   = var.cidr

  azs              = var.azs
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  enable_vpn_gateway        = false
  enable_flow_log           = true
  flow_log_destination_type = "s3"
  flow_log_destination_arn  = var.flow_logs_bucket_arn

  tags = var.tags
}

# S3 VPC Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.my_vpc.vpc_id
  service_name      = "com.amazonaws.${var.s3_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = module.my_vpc.private_route_table_ids
}

