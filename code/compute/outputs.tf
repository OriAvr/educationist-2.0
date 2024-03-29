output "private_key_openssh" {
  value     = module.my_key_pair.private_key_openssh
  sensitive = true
}

output "private_key_pem" {
  value     = module.my_key_pair.private_key_pem
  sensitive = true
}
