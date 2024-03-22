variable "s3_region" {
  description = "Region of the s3 to be used by the Gateway Endpoint."
  type        = string
  default     = "eu-west-3"
}

variable "azs" {
  description = "Region of the s3 to be used by the Gateway Endpoint."
  type        = list(string)
  default     = ["eu-west-3"]
}

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
