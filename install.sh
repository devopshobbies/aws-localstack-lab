#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform

touch ~/.bashrc

terraform -install-autocomplete

sudo apt-get install \

 apt-transport-https \

 ca-certificates \

 curl \

 software-properties-common 


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


sudo add-apt-repository \

 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \

 $(lsb_release -cs) \

 stable"

 sudo apt-get update
 sudo apt-get install docker docker-compose  awscli -y
