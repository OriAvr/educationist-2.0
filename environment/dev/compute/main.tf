module "my_key_pair" {
  source             = "github.com/terraform-aws-modules/terraform-aws-key-pair"
  key_name           = var.key_pair_name
  create_private_key = true
}

module "public_instance" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  name                        = var.public_instance_name
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  monitoring                  = true
  vpc_security_group_ids      = [module.public_sg.security_group_id]
  subnet_id                   = data.aws_ssm_parameter.public_subnet_id.value
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  depends_on = [module.my_key_pair]
}

module "private_instance" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  name                   = var.private_instance_name
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = data.aws_ssm_parameter.private_subnet_id.value

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  depends_on = [module.my_key_pair]
}

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
      protocol    = "-1" // -1 means all protocols
      description = "Allow all inbound traffic from within VPC"
      cidr_blocks = data.aws_ssm_parameter.vpc_cidr_block.value
    }
  ]
}


