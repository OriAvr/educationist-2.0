variable "instance_names" {
  description = "Name for the public EC2 instance."
  type        = list(string)
  default     = ["one"]
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "frontend_sg_name" {
  description = "Name for the public EC2 instance secrity group."
  type        = string
  default     = "frontend-instance-sg"
}

variable "backend_sg_name" {
  description = "Name for the private EC2 instance secrity group."
  type        = string
  default     = "backend-instance-sg"
}

variable "key_pair_name" {
  description = "Name for the EC2 instances key pair."
  type        = string
  default     = "instance_key_pair"
}

variable "tags" {
  description = "Tags for resources to indicate they are created by terraform and specify their environment."
  type        = map(string)
  default = {
    Terraform   = "true",
    Environment = "dev"
  }
}
