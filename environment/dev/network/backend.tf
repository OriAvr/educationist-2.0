terraform {
  backend "s3" {
    bucket = "educationist-remote-state"
    key    = "network/terraform.tfstate"
    region = "eu-west-3"
  }
}
