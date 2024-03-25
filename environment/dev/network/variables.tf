variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "my-vpc"
}

variable "cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}

variable "private_subnets" {
  description = "CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.101.0/24"]
}

variable "database_subnets" {
  description = "CIDR blocks for the database subnets."
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
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
  default     = ""
}

variable "s3_region" {
  description = "Region of the s3 to be used by the Gateway Endpoint."
  type        = string
  default     = "eu-west-3"
}

variable "tags" {
  description = "Tags for the VPC resource."
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}



/*
variable "flow_logs_bucket_name" {
  description = "Name of the s3 bucket that stores the VPC flow logs."
  type        = string
  default     = "educationist-flow-logs-bucket"
}

variable "s3_state" {
  description = "Name of the s3 bucket that stores the app state."
  type        = string
  default     = "educationist-remote-state-v2"
}

variable "s3_region" {
  description = "Region of the s3 to be used by the Gateway Endpoint."
  type        = string
  default     = "eu-west-3"
}
*/
