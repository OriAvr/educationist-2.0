instance_names  = ["one", "two", "three"]
instance_type   = "t3.large"
public_sg_name  = "public-instance-sg"
private_sg_name = "private-instance-sg"
key_pair_name   = "instance_key_pair"
tags = {
  Terraform   = "true",
  Environment = "stage"
}