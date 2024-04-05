module "my_rds" {
  source = "github.com/terraform-aws-modules/terraform-aws-rds"

  identifier            = var.identifier
  engine                = var.db_engine
  engine_version        = var.engine_version
  family                = var.family
  major_engine_version  = var.major_engine_version
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  db_name                     = var.db_name
  username                    = var.db_username
  manage_master_user_password = false
  password                    = var.db_password
  port                        = var.db_port

  multi_az             = var.multi_az
  db_subnet_group_name = var.db_subnet_group_name

  skip_final_snapshot = true
  deletion_protection = false

  iam_database_authentication_enabled = true

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = var.tags
}
