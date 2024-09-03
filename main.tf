# Cria a imagem para uso do cloud_init com base no template
resource "libvirt_cloudinit_disk" "commoninit" {
  # Verifica se é para criar a infra ou não
  count = var.criar_infra ? length(var.server_hostname) : 0
  name  = "${var.server_hostname[count.index]}-commoninit.iso"
  # usa um template como modelo para a configuração base do cloud_init
  user_data = templatefile("${path.module}/cloud_init.cfg", {
    hostname = var.server_hostname[count.index]
    fqdn     = "${var.server_hostname[count.index]}.${var.domain}"
  })
  # usa um template como modelo para a configuração de rede da(s) máquina(s)
  network_config = templatefile("${path.module}/network_config.cfg", {
    interface = var.interface
    ip_addr   = var.server_ips[count.index]
  })
  pool = libvirt_pool.ubuntu_pool.name
  # garante que só vai executar após ser criado o pool de imagens
  depends_on = [
    libvirt_pool.ubuntu_pool
  ]
}

# bloco para criar a(s) instância(s)
resource "libvirt_domain" "servidores" {
  # Verifica se é para criar a infra ou não
  count  = var.criar_infra ? length(var.server_hostname) : 0
  name   = var.server_hostname[count.index]
  memory = var.server_memory
  vcpu   = var.server_vcpu
  #qemu_agent = "true"

  disk {
    volume_id = element(libvirt_volume.os_image.*.id, count.index)
  }

  cloudinit = libvirt_cloudinit_disk.commoninit[count.index].id


  network_interface {
    network_name = libvirt_network.dev_network.name
    addresses    = [var.server_ips[count.index]]
  }


  /* Dica importante: o Ubuntu as vezes pode travar se não existir uma interface
     serial ativa no momento do boot. Caso a CPU fique em 100% e mesmo assim a
     máquina não fique disponível, pode ser este o motivo.
     A configuração abaixo serve para evitar isso.
  */
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = "true"
  }

  # Garante que só vai criar a instância depois que a rede e o disco do cloud_init estiverem disponíveis
  depends_on = [
    libvirt_pool.ubuntu_pool,
    libvirt_network.dev_network
  ]
}

resource "libvirt_pool" "ubuntu_pool" {
  name = "vm-pool"
  type = "dir"
  path = "/home/fabio/libvirt_images/ubuntu-pool/"
}

resource "libvirt_volume" "os_image" {
  # Verifica se é para criar a infra ou não
  count  = var.criar_infra ? length(var.server_hostname) : 0
  name   = "ubuntu_24-04_os_image.${var.server_hostname[count.index]}"
  pool   = libvirt_pool.ubuntu_pool.name
  source = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img"
  format = "qcow2"
  # garante que só vai executar após ser criado o pool de imagens
  depends_on = [
    libvirt_pool.ubuntu_pool
  ]
}