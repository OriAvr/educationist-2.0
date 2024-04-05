variable "db_engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "family" {
  description = "The engine family"
  type        = string
}


variable "major_engine_version" {
  description = "The major engine version to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "max_allocated_storage" {
  description = "The maximum allocated storage in gigabytes"
  type        = number
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}
variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "db_password" {
  description = "Password for the master DB user"
  type        = string
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = string
}

variable "multi_az" {
  description = "Whether to allow multi az deployment or not."
  type        = bool
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the VPC resource."
  type        = map(string)
}
