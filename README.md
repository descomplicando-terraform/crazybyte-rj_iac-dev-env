# crazybyte-rj_iac-dev-env

Repositório para código IaC projeto final do curso Descomplicando Terraforma - Linuxtips.

Provisionar um ambiente simples para auxiliar no provisionamento de máquinas virtuais para uso local por desenvolvedores.
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
| <a name="input_criar_infra"></a> [criar\_infra](#input\_criar\_infra) | Define se irá criar as máquinas ou não | `bool` | `false` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Define o domínio das máquinas sendo criadas | `string` | `"dev.local"` | no |
| <a name="input_interface"></a> [interface](#input\_interface) | Define o nome do dispositivo ethernet dentro da instância | `string` | `"ens3"` | no |
| <a name="input_server_hostname"></a> [server\_hostname](#input\_server\_hostname) | Define a lista de Nomes de cada instância a ser criada. | `list(string)` | <pre>[<br>  "srv01",<br>  "srv02"<br>]</pre> | no |
| <a name="input_server_ips"></a> [server\_ips](#input\_server\_ips) | Define a lista de IPs de cada máquina sendo criada. | `list(any)` | <pre>[<br>  "192.168.0.180",<br>  "192.168.0.190"<br>]</pre> | no |
| <a name="input_server_memory"></a> [server\_memory](#input\_server\_memory) | Define a quantidade de memória de cada instância. | `string` | `"1024"` | no |
| <a name="input_server_vcpu"></a> [server\_vcpu](#input\_server\_vcpu) | Define a quantidade de vCPUs de cada instância. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip"></a> [ip](#output\_ip) | Exibe o(s) endereço(s) IP(s) atribuído(s) à(s) instância(s) |
<!-- END_TF_DOCS -->