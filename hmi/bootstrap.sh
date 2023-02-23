#!/bin/bash
echo ""
echo ""
echo "Checking your Linux release:"
echo ""
cat /etc/os-release
echo ""
echo ""
echo "BOOTSTRAP:"
echo "----------------------------------------"
echo "update ssh config"
sudo su -
sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config
systemctl restart sshd
export DEBIAN_FRONTEND=noninteractive
echo "update resolv.conf"
rm /etc/resolv.conf
echo nameserver 8.8.8.8 > /etc/resolv.conf
echo "install dev tools"
apt-get update -y
apt-get install vim make libc++1 libc++abi1 -y
echo "install node"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install nodejs -y
echo "install yarn"
npm install --global yarn -y
echo "install docker engine"
apt-get remove docker docker-engine docker.io containerd runc -y
apt-get install ca-certificates curl gnupg lsb-release -y
mkdir -p /etc/apt/keyrings 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
echo "install docker compose"
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
groupadd docker
usermod -aG docker root
newgrp docker
echo "start docker service"
sudo service docker start
echo "install Unity"
sh -c 'echo "deb https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
wget -qO - https://hub.unity3d.com/linux/keys/public | sudo apt-key add -
apt update -y
apt-get install unityhub -y
#echo "install gui"
#apt install -y ubuntu-desktop
usermod -a -G sudo vagrant
#sudo shutdown -r now