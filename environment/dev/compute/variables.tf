variable "public_instance_name" {
  description = "Name for the public EC2 instance."
  type        = string
  default     = "public_instance"
}

variable "private_instance_name" {
  description = "Name for the private EC2 instance."
  type        = string
  default     = "private_instance"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "public_sg_name" {
  description = "Name for the public EC2 instance secrity group."
  type        = string
  default     = "public-instance-sg"
}

variable "private_sg_name" {
  description = "Name for the private EC2 instance secrity group."
  type        = string
  default     = "private-instance-sg"
}

variable "key_pair_name" {
  description = "Name for the EC2 instances key pair."
  type        = string
  default     = "instance_key_pair"
}
