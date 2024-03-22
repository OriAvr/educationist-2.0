output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "The ID of the public subnet"
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "The ID of the private subnet"
}

output "database_subnet_id" {
  value       = aws_subnet.database.id
  description = "The ID of the database subnet"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.this.id
  description = "The ID of the Internet Gateway"
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.this.id
  description = "The ID of the NAT Gateway"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "The ID of the public route table"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "The ID of the private route table"
}

output "database_route_table_id" {
  value       = aws_route_table.database.id
  description = "The ID of the database route table"
}

output "s3_vpc_endpoint_id" {
  value       = aws_vpc_endpoint.s3.id
  description = "The ID of the S3 VPC Endpoint"
}

output "s3_bucket_name" {
  value       = module.my_s3_bucket.bucket_name
  description = "The name of the S3 bucket used for flow logs"
}

output "flow_log_role_arn" {
  value       = aws_iam_role.flow_log_role.arn
  description = "The ARN of the IAM role for VPC flow logs"
}

