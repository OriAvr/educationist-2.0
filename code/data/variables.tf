variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "my-rds-db"
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "8.0"
}

variable "family" {
  description = "The engine family"
  type        = string
  default     = "mysql8.0"
}

variable "major_engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 10
}

variable "max_allocated_storage" {
  description = "The maximum allocated storage in gigabytes"
  type        = number
  default     = 50
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
  default     = "admin"
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 3306
}

variable "multi_az" {
  description = "Whether to allow multi az deployment or not."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for the VPC resource."
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

