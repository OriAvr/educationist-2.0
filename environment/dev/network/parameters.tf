resource "aws_ssm_parameter" "vpc_id" {
  name  = "${var.tags.Environment}/my_vpc/vpc_id"
  type  = "String"
  value = module.my_vpc.vpc_id
}

resource "aws_ssm_parameter" "vpc_cidr_block" {
  name  = "${var.tags.Environment}/my_vpc/vpc_cidr_block"
  type  = "String"
  value = module.my_vpc.vpc_cidr
}

resource "aws_ssm_parameter" "database_subnet_group" {
  name  = "${var.tags.Environment}/my_vpc/subnets/database_subnet_group"
  type  = "String"
  value = module.my_vpc.database_subnet_group
}

resource "aws_ssm_parameter" "vpc_default_security_group_id" {
  name  = "${var.tags.Environment}/my_vpc/subnets/vpc_default_security_group_id"
  type  = "String"
  value = module.my_vpc.default_security_group_id
}

resource "aws_ssm_parameter" "public_subnets_id" {
  name  = "${var.tags.Environment}/my_vpc/subnets/public_subnets_id"
  type  = "String"
  value = module.my_vpc.public_subnets[0]
}

resource "aws_ssm_parameter" "private_subnets_id" {
  name  = "${var.tags.Environment}/my_vpc/subnets/private_subnets_id"
  type  = "String"
  value = module.my_vpc.private_subnets[0]
}
