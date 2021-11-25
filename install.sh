#!/bin/bash
echo -e "\033[33m Updating packages... \033[0m"
sudo apt update -y

echo "\033[33m Installing tool packages... \033[0m"
sudo apt install -y lynx net-tools nmon ctop vim htop

echo "\033[33m Installing Docker... \033[0m"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ${USER}
#Activate for arm64!!!
#export DOCKER_CLI_EXPERIMENTAL=enabled

echo "\033[33m Installing pip, Docker-compose... \033[0m"
sudo apt install -y pip
sudo pip3 install docker-compose

echo "\033[33m Please log out and log back! \033[0m"
