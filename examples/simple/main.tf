/*
    Cria uma máquina com os dados básicos e os demais valores como padrão do módulo
    Neste modo, são usados os seguintes valores padrão:

    # dominio usado no hostname das máquinas
    domain => dev.local

    # nome da interface de rede a ser configurada nas máquinas
    interface => ens3

    # nome da rede virtual a ser criada
    virt_net_name => devnet

    # CIDR da rede a ser criada
    # É importante que seja igual ao da rede local para permitir o acesso as máquinas
    virt_net_cidr => 192.168.0.0/24

    # endereço do gateway de rede para as máquinas criadas
    # deve ser o mesmo da rede local para permitir o acesso à internet para as máquinas
    vir_gtw_addr => 192.168.0.54

    # endereço do segundo dns a ser usado nas máquinas
    # por padrão, o dns primário é sempre o do google - 8.8.8.8
    virt_dns_01 => 192.168.0.5

    # noome do pool de máquinas a ser criado
    virt_pool_name => vm-pool

    # diretório a ser criado para o pool de máquinas
    virt_pool_path => ~/virt-pool

    # nome da bridge pré-configurada que será usada pelo libvirt
    bridge_name => br0

    # define o nome do usuário padrão das instâncias
    user_name => "devuser"

    # define a senha do usuário padrão
    user_password => "devuser"

*/

/*
  lê o arquivo que contém a chave pública a ser usada no acesso
  Para gerar a chave, pode-se usar o comando abaixo:
    
    ssh-keygen -f simple

    Irá gerar 2 arquivos:
      simple <= chave privada
      simple.pub =< chave pública

*/

data "local_file" "pubkey" {
  filename = "${path.module}/simple.pub"
}

module "ambiente_01" {
  source = "github.com/descomplicando-terraform/crazybyte-rj_iac-dev-env"
  # definido como true para poder criar a infra
  criar_infra = true

  # dado obrigatório para permitir o acesso ssh nas máquinas
  ssh_pub_key = data.local_file.pubkey.content

  # define os dados da instância a ser criada
  instances = [
    {
      instance_name   = "web01"
      instance_ip     = "192.168.0.180"
      instance_memory = 1024
      instance_vcpu   = 1
  }]
}