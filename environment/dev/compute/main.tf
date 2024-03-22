module "public_instance" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  name                   = var.public_instance_name
  instance_type          = var.instance_type
  key_name               = module.my_key_pair.name
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]   #create sg
  subnet_id              = "subnet-eddcdzz4" #use ssm parameters for the subnet ids

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "private_instance" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  name                   = var.private_instance_name
  instance_type          = var.instance_type
  key_name               = module.my_key_pair.name
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "public_sg" {
  source = "https://github.com/terraform-aws-modules/terraform-aws-security-group"
}

module "private_sg" {
  source = "https://github.com/terraform-aws-modules/terraform-aws-security-group"
}

module "my_key_pair" {
  source             = "https://github.com/terraform-aws-modules/terraform-aws-key-pair"
  key_name           = "deployer-one"
  create_private_key = true
}
