

terraform {
  backend "s3" {
    bucket = "educationist-remote-state"
    key    = "data/terraform.tfstate"
    region = "eu-west-3"
  }
}
