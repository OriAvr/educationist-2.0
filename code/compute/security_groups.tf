module "frontend_sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group"

  name        = var.frontend_sg_name
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  // Allow inbound HTTP, HTTPS from anywhere
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow HTTP inbound from anywhere"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Allow HTTPS inbound from anywhere"
      cidr_blocks = "0.0.0.0/0"
      }, {
      from_port   = 3000
      to_port     = 3000
      protocol    = "-1"
      description = "Allow inbound on port 3000"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  // Allow all outbound traffic
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow all outbound traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "backend_sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group"

  name        = var.backend_sg_name
  description = "Security group for the backend server"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  // Allow inbound traffic from within VPC CIDR
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "-1"
      description = "Allow inbound ssh from within VPC."
      cidr_blocks = data.aws_ssm_parameter.vpc_cidr_block.value
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "-1"
      description = "Allow inbound mysql from within VPC."
      cidr_blocks = data.aws_ssm_parameter.vpc_cidr_block.value
    },
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "-1"
      description = "Allow inbound on port 3000"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow all outbound traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
