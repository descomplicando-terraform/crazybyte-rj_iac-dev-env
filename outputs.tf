output "ip" {
  description = "Exibe o(s) endereço(s) IP(s) atribuído(s) à(s) instância(s)"
  value       = libvirt_domain.servidores[*].network_interface[0].addresses[0]
}