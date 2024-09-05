# Instruções para utilização

## Requisitos

Você deve ter o KVM/libVirt instalado na sua máquina, bem como uma bridge ethernet configurada e funcional, além é claro do binário do Terraform.

Abaixo, seguem as dependências de pacotes a serem instalados para o KVM/libVirt e alguns links úteis para ajudar no processo de instalação/configuração da bridge.

#### **É FUNDAMENTAL QUE O AMBIENTE DO KVM/LIBVIRT ESTEJA FUNCIONAL PARA USAR CORRETAMENTE O MÓDULO**

### **Instalar dependências**

```shell
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install qemu-kvm libvirt-daemon-system virtinst libvirt-clients bridge-utils
```

**Ativando o libvirt na inicialização**

```shell
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```
**Checando se o libvirtd iniciou corretamente**

```shell
sudo systemctl status libvirtd
```

### **Ethernet Bridge configurada**

É essencial que já exista no sistema uma bridge configurada e funcional.

Caso não saiba como configurar uma bridge, seguem abaixo alguns links úteis:

https://www.youtube.com/watch?v=T7cnkONrA2s

https://www.tecmint.com/create-network-bridge-in-ubuntu/

https://linuxhint.com/install-kvm-ubuntu-22-04/

