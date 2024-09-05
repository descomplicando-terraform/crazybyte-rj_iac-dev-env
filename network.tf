resource "libvirt_network" "dev_network" {
  count = var.criar_infra ? 1 : 0
  name  = var.virt_net_name
  mode  = "bridge"

  addresses = var.virt_net_cidr
  bridge    = var.bridge_name
}