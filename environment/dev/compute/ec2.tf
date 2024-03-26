module "my_key_pair" {
  source             = "github.com/terraform-aws-modules/terraform-aws-key-pair"
  key_name           = var.key_pair_name
  create_private_key = true
}

module "public_instance" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  for_each = toset(var.instance_names)

  name                        = "public-instance-${each.key}"
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  monitoring                  = true
  vpc_security_group_ids      = [module.public_sg.security_group_id]
  subnet_id                   = data.aws_ssm_parameter.public_subnets_id.value
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  depends_on = [module.my_key_pair]
}

module "private_instance" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  for_each = toset(var.instance_names)

  name                   = "private-instance-${each.key}"
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = data.aws_ssm_parameter.private_subnets_id.value

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  depends_on = [module.my_key_pair]
}



