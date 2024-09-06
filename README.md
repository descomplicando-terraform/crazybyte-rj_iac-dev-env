# crazybyte-rj_iac-dev-env

Repositório para código IaC projeto final do curso Descomplicando Terraforma - Linuxtips.

Provisionar um ambiente simples para auxiliar no provisionamento de máquinas virtuais para uso local por desenvolvedores e também para outros tipos de cenários que necessitem de máquinas virtuais Linux para realizar testes ou laboratórios.

Para detalhes de como utilizar, veja o arquivo [USAGE.md](https://github.com/descomplicando-terraform/crazybyte-rj_iac-dev-env/blob/main/USAGE.md) e também exemplos de utilização na pasta [examples](https://github.com/descomplicando-terraform/crazybyte-rj_iac-dev-env/tree/main/examples).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | 0.7.6 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.7.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.commoninit](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7.6/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.servidores](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7.6/docs/resources/domain) | resource |
| [libvirt_network.dev_network](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7.6/docs/resources/network) | resource |
| [libvirt_pool.ubuntu_pool](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7.6/docs/resources/pool) | resource |
| [libvirt_volume.os_image](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7.6/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bridge_name"></a> [bridge\_name](#input\_bridge\_name) | Define o nome da bridge a ser usada (deve existir na máquina host) | `string` | `"br0"` | no |
| <a name="input_criar_infra"></a> [criar\_infra](#input\_criar\_infra) | Define se irá criar as máquinas ou não | `bool` | `false` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Define o domínio das máquinas sendo criadas | `string` | `"dev.local"` | no |
| <a name="input_interface"></a> [interface](#input\_interface) | Define o nome do dispositivo ethernet dentro da instância | `string` | `"ens3"` | no |
| <a name="input_server_hostname"></a> [server\_hostname](#input\_server\_hostname) | Define a lista de Nomes de cada instância a ser criada. | `list(string)` | <pre>[<br>  "srv01",<br>  "srv02"<br>]</pre> | no |
| <a name="input_server_ips"></a> [server\_ips](#input\_server\_ips) | Define a lista de IPs de cada máquina sendo criada. | `list(any)` | <pre>[<br>  "192.168.0.180",<br>  "192.168.0.190"<br>]</pre> | no |
| <a name="input_server_memory"></a> [server\_memory](#input\_server\_memory) | Define a quantidade de memória de cada instância. | `string` | `"1024"` | no |
| <a name="input_server_vcpu"></a> [server\_vcpu](#input\_server\_vcpu) | Define a quantidade de vCPUs de cada instância. | `number` | `1` | no |
| <a name="input_ssh_pub_key"></a> [ssh\_pub\_key](#input\_ssh\_pub\_key) | Define a chave pública SSH a ser usada para acesso nas instâncias virtuais | `string` | n/a | yes |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Define o nome do usuário padrão a ser criado nas instâncias | `string` | `"devuser"` | no |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | Define a senha do usuário padrão a ser criado nas instâncias | `string` | `"devuser"` | no |
| <a name="input_virt_dns_01"></a> [virt\_dns\_01](#input\_virt\_dns\_01) | Define o endereço do primeiro DNS a ser usado pelas instâncias virtuais. O segundo DNS, por padrão, é o 8.8.8.8 | `string` | `"192.168.0.5"` | no |
| <a name="input_virt_gtw_addr"></a> [virt\_gtw\_addr](#input\_virt\_gtw\_addr) | Define o gateway a ser usado na rede virtual | `string` | `"192.168.0.54"` | no |
| <a name="input_virt_net_cidr"></a> [virt\_net\_cidr](#input\_virt\_net\_cidr) | Define o CIDR a ser usado na rede virtual | `list(any)` | <pre>[<br>  "192.168.0.0/24"<br>]</pre> | no |
| <a name="input_virt_net_name"></a> [virt\_net\_name](#input\_virt\_net\_name) | Define o nome da rede virtual a ser criada | `string` | `"devnet"` | no |
| <a name="input_virt_pool_name"></a> [virt\_pool\_name](#input\_virt\_pool\_name) | Define o nome do pool a ser criado no LibVirt | `string` | `"vm-pool"` | no |
| <a name="input_virt_pool_path"></a> [virt\_pool\_path](#input\_virt\_pool\_path) | Define o path aonde serão criadas as imagens das VMs | `string` | `"~/virt-pool"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip"></a> [ip](#output\_ip) | Exibe o(s) endereço(s) IP(s) atribuído(s) à(s) instância(s) |
| <a name="output_password"></a> [password](#output\_password) | Exibe a senha do usuário criado para acessar as instâncias |
| <a name="output_user"></a> [user](#output\_user) | Exibe o usuário criado para acesso às instâncias |
<!-- END_TF_DOCS -->