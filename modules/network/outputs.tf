output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.my_vpc.vpc_id
}

output "vpc_cidr" {
  description = "The ID of the VPC"
  value       = module.my_vpc.vpc_cidr_block
}

output "database_subnet_group" {
  description = "The database subnet group name"
  value       = module.my_vpc.database_subnet_group
}

output "default_security_group_id" {
  description = "The VPC's default security group ID"
  value       = module.my_vpc.default_security_group_id
}

output "vpc_cidr_block" {
  description = "The CIDR block for IPs in the VPC"
  value       = module.my_vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "The public subnet IDs"
  value       = module.my_vpc.public_subnets
}

output "private_subnets" {
  description = "The private subnet IDs"
  value       = module.my_vpc.private_subnets
}

output "s3_vpc_endpoint_id" {
  description = "The ID of the S3 VPC Endpoint"
  value       = aws_vpc_endpoint.s3.id
}
