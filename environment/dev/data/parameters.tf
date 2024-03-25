data "aws_ssm_parameter" "vpc_id" {
  name = "/my_vpc/vpc_id"
}

data "aws_ssm_parameter" "vpc_cidr_block" {
  name = "/my_vpc/vpc_cidr_block"
}

data "aws_ssm_parameter" "database_subnet_group" {
  name = "/my_vpc/subnets/database_subnet_group"
}


data "aws_ssm_parameter" "vpc_default_security_group_id" {
  name = "/my_vpc/subnets/vpc_default_security_group_id"
}

