resource "libvirt_network" "dev_network" {
  name = "devnet"
  mode = "bridge"

  addresses = ["192.168.0.0/24"]
  bridge    = "br0"
}