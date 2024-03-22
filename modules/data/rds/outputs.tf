output "db_instance_identifier" {
  value = module.db_instance.db_instance_identifier
}

output "db_instance_endpoint" {
  value = module.db_instance.db_instance_endpoint
}

output "db_instance_port" {
  value = module.db_instance.db_instance_port
}

output "db_name" {
  value = var.db_name
}

output "db_subnet_group_name" {
  value = local.db_subnet_group_name
}

output "db_master_username" {
  value = var.username
}

output "storage_encrypted" {
  value = var.storage_encrypted
}

