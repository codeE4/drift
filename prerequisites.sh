#!/bin/bash

###BasicPackages
echo"---------------------------------------------------------"
echo"------------------Installing Packages--------------------"
echo"---------------------------------------------------------"
sleep 2;

cd
apt update -y
apt upgrade -y
apt install git -y
apt install wget -y
apt install curl -y
apt install vim -y
apt install sudo -y
apt install gnupg gnupg2 gnupg1 -y
apt install conntrack -y

timedatectl set-timezone America/New_York

#Photon
echo"---------------------------------------------------------"
echo"------------------Installing Photon--------------------"
echo"---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://gitlab.acceleratefoundation.io/root/photon.git
cd photon
cd cli
npm install
npm link

#LXD
echo"---------------------------------------------------------"
echo"------------------Installing LXD-------------------------"
echo"---------------------------------------------------------"
sleep 2;

cd /root/
sudo apt --yes install snapd
snap install lxd
echo "LXD Init"
echo "Waiting 30 seconds for LXD to spin up"
sleep 30;

cat > /root/.lxd-answers.txt <<- EOF
yes
default
btrfs
yes
no
20
no
yes
lxdbr0
auto
auto
yes
all
8443


no
yes
EOF

/snap/bin/lxd init < /root/.lxd-answers.txt


#Base-Image
echo"---------------------------------------------------------"
echo"------------------Installing Base Image------------------"
echo"---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://github.com/codeE4/base-image.git
photon container --create
lxc stop base --force
lxc publish base --alias=base
lxc delete base --force

#Lab
echo"---------------------------------------------------------"
echo"------------------Installing Lab Container---------------"
echo"---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://github.com/codeE4/lab.git

echo"---------------------------------------------------------"
echo"---------------------Build Complete----------------------"
echo"---------------------------------------------------------"
echo"----------------Dont do anything illegal-----------------"
echo"---------------------------------------------------------"
echo"--------------------------or-----------------------------"
echo"---------------------------------------------------------"
echo"---------------------------------------------------------"
echo"---------------------------------------------------------"
echo"---------------------------------------------------------"
echo"---------------------------------------------------------"
echo"---------------------------------------------------------"
echo"-------------------Stay Annonymous-----------------------"
echo"---------------------------------------------------------"
