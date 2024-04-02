module "my_rds_instance" {
  source = "../../modules/data/rds"

  identifier            = var.identifier
  db_engine             = var.db_engine
  engine_version        = var.engine_version
  family                = var.family
  major_engine_version  = var.major_engine_version
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  db_name     = var.db_name
  db_username = var.db_username
  db_port     = var.db_port

  multi_az             = var.multi_az
  db_subnet_group_name = data.aws_ssm_parameter.database_subnet_group.value

  vpc_security_group_ids = [data.aws_ssm_parameter.vpc_default_security_group_id.value, module.db_sg.security_group_id]

  tags = var.tags
}


module "db_sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group"

  name        = var.db_sg_name
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  // Allow inbound traffic from within VPC CIDR
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "Allow PostgreSQL access from within VPC"
      cidr_blocks = data.aws_ssm_parameter.vpc_cidr_block.value
    }
  ]

  ingress_with_source_security_group_id = [
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      description              = "Allow all inbound traffic from the backend instances"
      source_security_group_id = data.aws_ssm_parameter.private_sg_id.value
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

/*
module "my_s3_bucket" {
  source      = "../../../modules/data/s3"
  bucket_name = "educationist-files"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowAccessFromVPCOnly",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::educationist-files/*",
        "Condition" : {
          "StringEquals" : {
            "aws:SourceVpce" : "${data.aws_ssm_parameter.vpc_id}"
          }
        }
      },
      {
        "Sid" : "DenyAccessFromOutsideVPC",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::educationist-files/*",
        "Condition" : {
          "StringNotEquals" : {
            "aws:SourceVpce" : "${data.aws_ssm_parameter.vpc_id}"
          }
        }
      }
    ]
  })
}
*/
