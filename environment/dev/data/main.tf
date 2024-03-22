data "aws_ssm_parameter" "database_subnet_id" {
  name = "/network/my_vpc/subnets/database_subnet_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
  name = "/network/my_vpc/subnets/private_subnet_id"
}

module "my_rds_instance" {
  source = "../../../modules/data/rds"

  identifier         = "my-db-instance"
  create_db_instance = true
  engine             = "mysql"
  engine_version     = "5.7"
  instance_class     = "db.t3.micro"
  allocated_storage  = 10
  storage_type       = "gp2"
  db_name            = "mydatabase"
  username           = "admin"
  password           = "securepassword"

  create_db_subnet_group = true
  db_subnet_group_name   = "rds-subnet-group"
  subnet_ids             = [data.aws_ssm_parameter.database_subnet_id.value, data.aws_ssm_parameter.private_subnet_id.value]

  tags = {
    Environment = "development"
  }
}

module "public_sg" {
  source = "https://github.com/terraform-aws-modules/terraform-aws-security-group"
}
