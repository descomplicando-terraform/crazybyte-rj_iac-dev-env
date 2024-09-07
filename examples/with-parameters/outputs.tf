output "hosts" {
  description = "Instâncias criadas"
  value       = module.web-dev-env.hostnames_and_ips
}

output "user" {
  description = "Instâncias criadas"
  value       = module.web-dev-env.user
}

output "password" {
  description = "Instâncias criadas"
  value       = module.web-dev-env.password
}