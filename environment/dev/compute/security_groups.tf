module "public_sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group"

  name        = var.public_sg_name
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  // Allow inbound SSH, HTTP, HTTPS from anywhere
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
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow SSH inbound from anywhere"
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

module "private_sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group"

  name        = var.private_sg_name
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  // Allow inbound traffic from within VPC CIDR
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow all inbound traffic from within VPC"
      cidr_blocks = data.aws_ssm_parameter.vpc_cidr_block.value
      }, {
      from_port                = 0
      to_port                  = 0
      protocol                 = "-1"
      description              = "Allow all inbound traffic from within VPC"
      source_security_group_id = module.public_sg.security_group_id
      }, {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow SSH inbound from anywhere"
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
