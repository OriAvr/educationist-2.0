data "aws_ssm_parameter" "vpc_id" {
  name = "/my_vpc/vpc_id"
}

data "aws_ssm_parameter" "public_subnets_id" {
  name = "/my_vpc/subnets/public_subnets_id"
}

data "aws_ssm_parameter" "private_subnets_id" {
  name = "/my_vpc/subnets/private_subnets_id"
}

data "aws_ssm_parameter" "vpc_cidr_block" {
  name = "/my_vpc/vpc_cidr_block"
}
