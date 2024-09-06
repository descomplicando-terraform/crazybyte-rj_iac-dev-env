# Instruções para utilização

## Informações úteis

### O que é o Libvirt?

Libvirt é uma API (Application Programming Interface) de código aberto e uma biblioteca de gerenciamento de virtualização que fornece uma interface comum para interagir com diferentes tecnologias de virtualização, como KVM (Kernel-based Virtual Machine), QEMU (Quick Emulator), Xen, LXC (Linux Containers) e outros. Ele permite que os administradores de sistema gerenciem e controlem as máquinas virtuais e os recursos de virtualização de forma eficiente e simplificada.

### Como funciona o Libvirt?

O Libvirt atua como uma camada de abstração entre as tecnologias de virtualização subjacentes e as ferramentas de gerenciamento. Ele fornece uma API consistente e padronizada para criar, iniciar, parar, pausar, migrar e monitorar máquinas virtuais, independentemente da tecnologia de virtualização utilizada. Isso significa que os administradores de sistema podem usar comandos e scripts comuns para gerenciar diferentes tipos de virtualização, sem precisar se preocupar com os detalhes específicos de cada tecnologia.


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
**Opcionalmente pode-se usar o comando abaixo para instalar o virt-manager para facilitar o gerenciamento**

```shell
sudo apt-get install virt-manager virt-viewer
```

### **Ethernet Bridge configurada**

É essencial que já exista no sistema uma bridge configurada e funcional.

Caso não saiba como configurar uma bridge, seguem abaixo alguns links úteis:

https://www.youtube.com/watch?v=T7cnkONrA2s

https://www.tecmint.com/create-network-bridge-in-ubuntu/

https://linuxhint.com/install-kvm-ubuntu-22-04/

## Usando o módulo

Na pasta examples estão alguns exemplos simples mostrando algumas formas de utilização deste módulo.