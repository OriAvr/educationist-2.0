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

module "private_sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group"

  name        = var.rds_sg_name
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  // Allow inbound traffic from within VPC CIDR
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1" // -1 means all protocols
      description = "Allow all inbound traffic from within VPC"
      cidr_blocks = data.aws_ssm_parameter.vpc_cidr_block.value
    }
  ]
}
