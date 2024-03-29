identifier            = "my-rds-db"
db_engine             = "mysql"
engine_version        = "8.0"
family                = "mysql8.0"
major_engine_version  = "8.0"
instance_class        = "db.t3.micro"
allocated_storage     = 10
max_allocated_storage = 50
db_name               = "mydatabase"
db_username           = "admin"
db_port               = 3306
multi_az              = false
tags = {
  Terraform   = "true"
  Environment = "dev"
}
