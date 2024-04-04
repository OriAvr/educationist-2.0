data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.tags.Environment}/my_vpc/vpc_id"
}

data "aws_ssm_parameter" "vpc_cidr_block" {
  name = "/${var.tags.Environment}/my_vpc/vpc_cidr_block"
}

data "aws_ssm_parameter" "private_subnets_cidr_block" {
  name = "/${var.tags.Environment}/my_vpc/private_subnets_cidr_block"
}

data "aws_ssm_parameter" "database_subnet_group" {
  name = "/${var.tags.Environment}/my_vpc/subnets/database_subnet_group"
}

data "aws_ssm_parameter" "vpc_default_security_group_id" {
  name = "/${var.tags.Environment}/my_vpc/subnets/vpc_default_security_group_id"
}

resource "aws_ssm_parameter" "db_endpoint" {
  name  = "/${var.tags.Environment}/my_db/db_endpoint"
  type  = "String"
  value = module.my_rds_instance.db_instance_endpoint
}
