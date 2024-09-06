# Cria a infra usando os valores padrão do módulo e uma chave pública de SSH a partir do arquivo

data "local_file" "pubkey" {
  filename = "${path.module}/simple.pub"
}

module "ambiente_01" {
  source      = "github.com/descomplicando-terraform/crazybyte-rj_iac-dev-env"
  criar_infra = true
  ssh_pub_key = data.local_file.pubkey.content


}