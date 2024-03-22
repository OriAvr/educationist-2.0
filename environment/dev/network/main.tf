module "my_vpc" {
  source                = "../../../modules/network"
  s3_region             = var.s3_region
  azs                   = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  flow_logs_bucket_name = var.flow_logs_bucket_name
}

resource "aws_ssm_parameter" "database_subnet_id" {
  name  = "/network/my_vpc/subnets/database_subnet_id"
  type  = "String"
  value = module.my_vpc.database_subnet_id
}

resource "aws_ssm_parameter" "private_subnet_id" {
  name  = "/network/my_vpc/subnets/private_subnet_id"
  type  = "String"
  value = module.my_vpc.private_subnet_id
}

