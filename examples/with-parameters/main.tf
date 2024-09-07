
/*
    Cria a infra usando os valores especificados e uma chave pública de SSH a partir do arquivo
    Este exemplo passa dados para todos os parametros esperados pelo módulo.
    
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

module "web-dev-env" {
  source = "github.com/descomplicando-terraform/crazybyte-rj_iac-dev-env?ref=feature-newversion"
  # definido como true para poder criar a infra
  criar_infra = true

  # dado obrigatório para permitir o acesso ssh nas máquinas
  ssh_pub_key = data.local_file.pubkey.content

  virt_net_name  = "web-net-net"
  virt_pool_name = "webpool"
  # o usuário que executará o código terraform precisa ter permissão para criar a pasta
  virt_pool_path = "/srv"
  virt_gtw_addr  = "10.0.3.254"
  virt_net_cidr  = ["10.0.0.0/22"]
  virt_dns_01    = "10.0.0.2"
  user_name      = "webuser"
  user_password  = "$3c4etW38"

  instances = [
    {
      instance_name   = "web01"
      instance_ip     = "192.168.0.180"
      instance_memory = 1024
      instance_vcpu   = 1
    },
    {
      instance_name   = "web02"
      instance_ip     = "192.168.0.190"
      instance_memory = 1024
      instance_vcpu   = 1
    },
    {
      instance_name   = "lb01"
      instance_ip     = "192.168.0.181"
      instance_memory = 1024
      instance_vcpu   = 1
    }
  ]
}