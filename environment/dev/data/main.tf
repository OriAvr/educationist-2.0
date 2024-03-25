module "my_rds_instance" {
  source = "../../../modules/data/rds"

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

  vpc_security_group_ids = [data.aws_ssm_parameter.vpc_default_security_group_id.value]

  tags = var.tags
}

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

/*
module "my_rds_instance" {
  source = "../../../modules/data/rds"

  identifier         = "my-db-instance"
  create_db_instance = true
  engine             = "mysql"
  engine_version     = "5.7"
  instance_class     = "db.t3.micro"
  allocated_storage  = 10
  storage_type       = "gp2"
  db_name            = "mydatabase"
  username           = "admin"
  password           = "securepassword"

  create_db_subnet_group = true
  db_subnet_group_name   = "rds-subnet-group"
  subnet_ids             = [data.aws_ssm_parameter.database_subnet_id.value, data.aws_ssm_parameter.private_subnet_id.value]
  vpc_security_group_ids = [module.rds_sg.security_group_id]

  tags = {
    Environment = "development"
  }
}

module "rds_sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group"

  name        = var.rds_sg_name
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
*/
