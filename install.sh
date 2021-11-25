#!/bin/bash
echo -e "\033[33m Updating packages... \033[0m"
sudo apt update -y

echo "\033[33m Installing tool packages... \033[0m"
sudo apt install -y lynx net-tools nmon ctop vim htop

echo "\033[33m Installing Docker... \033[0m"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64]  focal stable"
sudo apt update
sudo apt install -y docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ${USER}
#Activate for arm64!!!
#export DOCKER_CLI_EXPERIMENTAL=enabled

echo "\033[33m Installing pip, Docker-compose... \033[0m"
sudo apt install -y pip
sudo pip3 install docker-compose

echo "\033[33m  \033[0m"
echo "\033[33m  \033[0m"
echo "\033[33m  \033[0m"
echo "\033[33m Please log out and log back! \033[0m"
