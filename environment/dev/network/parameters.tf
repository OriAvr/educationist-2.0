/*
resource "aws_ssm_parameter" "vpc_id" {
  name  = "/my_vpc/vpc_id"
  type  = "String"
  value = module.my_vpc.vpc_id
}

resource "aws_ssm_parameter" "database_subnet_id" {
  name  = "/my_vpc/subnets/database_subnet_id"
  type  = "String"
  value = module.my_vpc.database_subnet_id
}

resource "aws_ssm_parameter" "private_subnet_id" {
  name  = "/my_vpc/subnets/private_subnet_id"
  type  = "String"
  value = module.my_vpc.private_subnet_id
}

resource "aws_ssm_parameter" "public_subnet_id" {
  name  = "/my_vpc/subnets/public_subnet_id"
  type  = "String"
  value = module.my_vpc.public_subnet_id
}

resource "aws_ssm_parameter" "vpc_cidr_block" {
  name  = "/my_vpc/vpc_cidr_block"
  type  = "String"
  value = module.my_vpc.vpc_cidr
}
*/
