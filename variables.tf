variable "criar_infra" {
  type        = bool
  description = "Define se irá criar as máquinas ou não"
  default     = false
}

variable "domain" {
  type        = string
  description = "Define o domínio das máquinas sendo criadas"
  default     = "dev.local"
}

variable "interface" {
  type        = string
  description = "Define o nome do dispositivo ethernet dentro da instância"
  default     = "ens3"
}

variable "virt_net_name" {
  type        = string
  description = "Define o nome da rede virtual a ser criada"
  default     = "devnet"
}

variable "virt_net_cidr" {
  type        = list(any)
  description = "Define o CIDR a ser usado na rede virtual"
  default     = ["192.168.0.0/24"]
}

variable "virt_gtw_addr" {
  type        = string
  description = "Define o gateway a ser usado na rede virtual"
  default     = "192.168.0.54"
}

variable "virt_dns_01" {
  type        = string
  description = "Define o endereço do primeiro DNS a ser usado pelas instâncias virtuais. O segundo DNS, por padrão, é o 8.8.8.8"
  default     = "192.168.0.5"
}

variable "virt_pool_name" {
  type        = string
  description = "Define o nome do pool a ser criado no LibVirt"
  default     = "vm-pool"
}

variable "virt_pool_path" {
  type        = string
  description = "Define o path aonde serão criadas as imagens das VMs"
  default     = "~/virt-pool"
}

variable "bridge_name" {
  type        = string
  description = "Define o nome da bridge a ser usada (deve existir na máquina host)"
  default     = "br0"
}

variable "server_ips" {
  type        = list(any)
  description = "Define a lista de IPs de cada máquina sendo criada."
  default     = ["192.168.0.180", "192.168.0.190"]
  /*   validation {
    condition     = length(var.server_ips) == length(var.server_hostname)
    error_message = "A quantidade de endereços IP deve ser igual a quantidade de hostnames"
  } */
}

variable "server_memory" {
  type        = string
  description = "Define a quantidade de memória de cada instância."
  default     = "1024"
}

variable "server_vcpu" {
  type        = number
  description = "Define a quantidade de vCPUs de cada instância."
  default     = 1
}

variable "server_hostname" {
  type        = list(string)
  description = "Define a lista de Nomes de cada instância a ser criada."
  default     = ["srv01", "srv02"]
  validation {
    condition     = length(var.server_hostname) == length(var.server_ips)
    error_message = "A quantidade de hosts deve ser igual a quantidade de endereços IP"
  }
}

variable "ssh_pub_key" {
  type        = string
  description = "Define a chave pública SSH a ser usada para acesso nas instâncias virtuais"
  validation {
    condition     = length(var.ssh_pub_key) > 16 && (substr(var.ssh_pub_key, 0, 4) == "ssh-" || substr(var.ssh_pub_key, 0, 6) == "ecdsa-")
    error_message = "O valor informado para a chave pública ssh está vazio ou incorreto"
  }

}

variable "user_name" {
  type        = string
  description = "Define o nome do usuário padrão a ser criado nas instâncias"
  default     = "devuser"
}

variable "user_password" {
  type        = string
  description = "Define a senha do usuário padrão a ser criado nas instâncias"
  default     = "devuser"
}
