variable "public_instance_name" {
  description = "Name for the public EC2 instance."
  default     = "public_instance"
  type        = string
}

variable "private_instance_name" {
  description = "Name for the private EC2 instance."
  default     = "private_instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}
