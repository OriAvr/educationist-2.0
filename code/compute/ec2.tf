module "my_key_pair" {
  source             = "github.com/terraform-aws-modules/terraform-aws-key-pair"
  key_name           = var.key_pair_name
  create_private_key = true
}

module "backend_instance" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  for_each = toset(var.instance_names)

  name                        = "backend-instance-${each.key}"
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  monitoring                  = true
  vpc_security_group_ids      = [module.backend_sg.security_group_id]
  subnet_id                   = data.aws_ssm_parameter.public_subnets_id.value
  associate_public_ip_address = true

  user_data = templatefile("backend_instance.sh.tpl", {
    db_host     = data.aws_ssm_parameter.db_address.value
    db_username = "admin"
    db_password = data.aws_secretsmanager_secret_version.db_password.secret_string
    db_name     = "education_platform"
  })
  tags       = var.tags
  depends_on = [module.my_key_pair]
}

module "frontend_instance" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  for_each = toset(var.instance_names)

  name                        = "frontend-instance-${each.key}"
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  monitoring                  = true
  vpc_security_group_ids      = [module.frontend_sg.security_group_id]
  subnet_id                   = data.aws_ssm_parameter.public_subnets_id.value
  associate_public_ip_address = true

  user_data = templatefile("frontend_instance.sh.tpl", {
    server_ip = module.backend_instance[each.key].public_ip
  })
  tags       = var.tags
  depends_on = [module.my_key_pair, module.backend_instance]
}
