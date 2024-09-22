#!/bin/bash

# Desinstalar o Docker
echo "Removendo o Docker..."
sudo apt-get remove --purge -y docker-ce docker-ce-cli containerd.io

# Remover dependências não usadas
echo "Removendo dependências não utilizadas..."
sudo apt-get autoremove -y

# Remover imagens, contêineres e volumes
echo "Removendo imagens, contêineres e volumes..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

# Atualizar o repositório
echo "Atualizando repositório..."
sudo apt-get update

# Instalar dependências
echo "Instalando dependências..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adicionar chave GPG do Docker
echo "Adicionando chave GPG do Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adicionar repositório do Docker
echo "Adicionando repositório do Docker..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable"

# Atualizar repositório novamente
echo "Atualizando repositório novamente..."
sudo apt-get update

# Instalar o Docker
echo "Instalando o Docker..."
sudo apt-get install -y docker-ce

# Iniciar o Docker
echo "Iniciando o Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# Verificar status do Docker
echo "Verificando status do Docker..."
sudo systemctl status docker

echo "Docker foi reinstalado com sucesso!"
