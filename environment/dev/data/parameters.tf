
data "aws_ssm_parameter" "vpc_id" {
  name = "/my_vpc/vpc_id"
}

data "aws_ssm_parameter" "vpc_cidr_block" {
  name = "/my_vpc/vpc_cidr_block"
}

data "aws_ssm_parameter" "database_subnet_id" {
  name = "/my_vpc/subnets/database_subnet_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
  name = "/my_vpc/subnets/private_subnet_id"
}
