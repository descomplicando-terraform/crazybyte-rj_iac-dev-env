output "hosts" {
  description = "Instâncias criadas"
  value       = module.ambiente_01.hostnames_and_ips
}

output "user" {
  description = "Instâncias criadas"
  value       = module.ambiente_01.user
}

output "password" {
  description = "Instâncias criadas"
  value       = module.ambiente_01.password
}