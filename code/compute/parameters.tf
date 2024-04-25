data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.tags.Environment}/my_vpc/vpc_id"
}

data "aws_ssm_parameter" "public_subnets_id" {
  name = "/${var.tags.Environment}/my_vpc/subnets/public_subnets_id"
}

data "aws_ssm_parameter" "private_subnets_id" {
  name = "/${var.tags.Environment}/my_vpc/subnets/private_subnets_id"
}

data "aws_ssm_parameter" "vpc_cidr_block" {
  name = "/${var.tags.Environment}/my_vpc/vpc_cidr_block"
}

data "aws_secretsmanager_secret" "db_pass" {
  name = "db_password"
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = data.aws_secretsmanager_secret.db_pass.id
}

data "aws_ssm_parameter" "db_address" {
  name = "/${var.tags.Environment}/my_db/db_address"
}
