resource "aws_ssm_parameter" "vpc_id" {
  name  = "/my_vpc/vpc_id"
  type  = "String"
  value = module.my_vpc.vpc_id
}

resource "aws_ssm_parameter" "vpc_cidr_block" {
  name  = "/my_vpc/vpc_cidr_block"
  type  = "String"
  value = module.my_vpc.vpc_cidr
}

resource "aws_ssm_parameter" "database_subnet_group" {
  name  = "/my_vpc/subnets/database_subnet_group"
  type  = "String"
  value = module.my_vpc.database_subnet_group
}

resource "aws_ssm_parameter" "vpc_default_security_group_id" {
  name  = "/my_vpc/subnets/vpc_default_security_group_id"
  type  = "String"
  value = module.my_vpc.default_security_group_id
}

