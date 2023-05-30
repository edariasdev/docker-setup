#!/usr/bin/bash

codeName=$(cat /etc/os-release | grep VERSION_CODENAME | cut -d "=" -f 2)

#Installing Docker
echo "Installing Docker"
apt update &&\
apt install apt-transport-https ca-certificates curl software-properties-common &&\
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&\
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${codeName} stable" &&\
apt update
apt install docker-ce &&\
usermod -aG docker $(echo $SUDO_USER) &&\
echo "Done!"


#Installing Compose
echo "Installing Compose"
curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&\
chmod +x /usr/local/bin/docker-compose
echo "Done!"
