module "my_key_pair" {
  source             = "github.com/terraform-aws-modules/terraform-aws-key-pair"
  key_name           = var.key_pair_name
  create_private_key = true
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

  user_data = <<-EOF
                #!/bin/bash
                # Update system
                yum update -y
                yum install mysql
                EOF

  tags       = var.tags
  depends_on = [module.my_key_pair]
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

  user_data = templatefile("user_data.sh.tpl", {
    private_instance_private_ip = module.private_instance[each.key].private_ip
    private_key_pair            = module.my_key_pair.private_key_pem
    private_instance_ip         = module.private_instance[each.key].private_ip
    db_password                 = data.aws_secretsmanager_secret_version.db_password.secret_string
    db_endpoint                 = data.aws_ssm_parameter.db_endpoint.value
  })
  tags       = var.tags
  depends_on = [module.my_key_pair, module.private_instance]
}
