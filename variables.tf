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

variable "server_ips" {
  type        = list(any)
  description = "Define a lista de IPs de cada máquina sendo criada."
  default     = ["192.168.0.180", "192.168.0.190"]
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
}

variable "criar_infra" {
  type        = bool
  description = "Define se irá criar as máquinas ou não"
  default     = false
}