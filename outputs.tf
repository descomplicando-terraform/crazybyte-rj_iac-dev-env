output "ip" {
  value = libvirt_domain.servidores[*].network_interface[0].addresses[0]
}