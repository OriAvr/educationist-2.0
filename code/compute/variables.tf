variable "instance_names" {
  description = "Name for the public EC2 instance."
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "public_sg_name" {
  description = "Name for the public EC2 instance secrity group."
  type        = string
}

variable "private_sg_name" {
  description = "Name for the private EC2 instance secrity group."
  type        = string
}

variable "key_pair_name" {
  description = "Name for the EC2 instances key pair."
  type        = string
}

variable "tags" {
  description = "Tags for resources to indicate they are created by terraform and specify their environment."
  type        = map(string)
}
