name                   = "my-vpc"
cidr                   = "10.0.0.0/16"
azs                    = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
private_subnets        = ["10.0.1.0/24"]
public_subnets         = ["10.0.101.0/24"]
database_subnets       = ["10.0.2.0/24", "10.0.3.0/24"]
enable_nat_gateway     = true
single_nat_gateway     = true
one_nat_gateway_per_az = false
flow_logs_bucket_arn   = ""
s3_region              = "eu-west-3"
tags = {
  Terraform   = "true"
  Environment = "stage"
}
