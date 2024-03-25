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
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true to allow only one NAT Gateway in the VPC"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Should be false to allow only one NAT Gateway in the VPC"
  type        = bool
  default     = false
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

/*
variable "cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "database_subnet_cidr" {
  description = "CIDR block for the database subnet."
  type        = string
  default     = "10.0.3.0/24"
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = false
}

variable "s3_region" {
  description = "Region of the s3 to be used by the Gateway Endpoint."
  type        = string
}

variable "flow_logs_bucket_name" {
  description = "S3 flow logs bucket name"
  type        = string
}

variable "bucket_sse_alg" {
  description = "SSE algorithm to be used by the bucket."
  default     = "aws:kms"
  type        = string
}

variable "kms_key_deletion_window" {
  description = "The window for the KMS key to be deleted(in days)."
  default     = 10
  type        = number
}
*/
