locals {
  create_db_subnet_group    = var.create_db_subnet_group
  create_db_parameter_group = var.create_db_parameter_group
  create_db_instance        = var.create_db_instance

  db_subnet_group_name = var.create_db_subnet_group ? module.db_subnet_group.db_subnet_group_id : var.db_subnet_group_name
}

module "db_subnet_group" {
  source = "./db_subnet_group"

  create = local.create_db_subnet_group

  name            = coalesce(var.db_subnet_group_name, var.identifier)
  use_name_prefix = var.db_subnet_group_use_name_prefix
  description     = var.db_subnet_group_description
  subnet_ids      = var.subnet_ids

  tags = merge(var.tags, var.db_subnet_group_tags)
}

module "db_instance" {
  source = "./db_instance"

  create     = local.create_db_instance
  identifier = var.identifier

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id

  db_name                             = var.db_name
  username                            = var.username
  password                            = var.password
  port                                = var.port
  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = local.db_subnet_group_name

  availability_zone   = var.availability_zone
  multi_az            = var.multi_az
  skip_final_snapshot = var.skip_final_snapshot

  tags = var.tags
}
