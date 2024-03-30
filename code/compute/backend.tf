/*terraform {
  backend "s3" {
    bucket = "educationist-remote-state"
    key    = "compute/terraform.tfstate"
    region = "eu-west-3"
  }
}*/

terraform {
  cloud {
    organization = "Ori-Avraham"
    workspaces {
      name = "educationist-compute"
    }
  }
}
