#!/bin/bash
echo '====INSTALL DOCKER===='

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}
su - ${USER}
sudo usermod -aG docker vagrant


