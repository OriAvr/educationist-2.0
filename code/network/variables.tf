variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for the private subnets."
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)
}

variable "database_subnets" {
  description = "CIDR blocks for the database subnets."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Should be true to enable NAT Gateway in the VPC"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Should be true to allow only one NAT Gateway in the VPC"
  type        = bool
}

variable "one_nat_gateway_per_az" {
  description = "Should be false to allow only one NAT Gateway in the VPC"
  type        = bool
}

variable "flow_logs_bucket_arn" {
  description = "S3 flow logs bucket ARN"
  type        = string
}

variable "s3_region" {
  description = "Region of the s3 to be used by the Gateway Endpoint."
  type        = string
}

variable "tags" {
  description = "Tags for the VPC resource."
  type        = map(string)
}
