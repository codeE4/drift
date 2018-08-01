#!/bin/bash

echo "---------------------------------------------------------"
echo "-------------------You found a Chug Jug------------------"
echo "---------------------------------------------------------"

###BasicPackages
echo "---------------------------------------------------------"
echo "------------------Installing Packages--------------------"
echo "---------------------------------------------------------"
echo "-----------------This may take some time-----------------"
echo "---------------------------------------------------------"
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
apt install nodejs -y
apt install build-essential -y
apt install libreadline-dev -y
apt install libssl-dev -y
apt install libpq5 -y
apt install libpq-dev -y
apt install libreadline5 -y
apt install libsqlite3-dev -y
apt install libpcap-dev -y
apt install git-core -y
apt install autoconf -y
apt install postgresql -y
apt install pgadmin3 -y
apt install zlib1g-dev -y
apt install libxml2-dev -y
apt install libxslt1-dev -y
apt install vncviewer -y
apt install libyaml-dev -y
apt install zlib1g-dev -y
apt install nmap -y
apt install dig -y
apt install whois -y
apt install tshark -y


timedatectl set-timezone America/New_York

#Photon
echo "---------------------------------------------------------"
echo "------------------Installing Photon----------------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://gitlab.acceleratefoundation.io/root/photon.git
cd photon
cd cli
npm install
npm link

#LXD
echo "---------------------------------------------------------"
echo "------------------Installing LXD-------------------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root/
sudo apt --yes install snapd
snap install lxd
echo "--------------------------------------"
echo "--------------LXD Init----------------"
echo "--------------------------------------"
echo "Waiting 60 seconds for LXD to spin up"
echo "--------------------------------------"
sleep 60;

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
echo "---------------------------------------------------------"
echo "------------------Installing Base Image------------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://github.com/codeE4/base-image.git
photon container --create
lxc stop base --force
lxc publish base --alias=base
lxc delete base --force

#Lab
echo "---------------------------------------------------------"
echo "------------------Installing Lab Container---------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://github.com/codeE4/lab.git

echo "---------------------------------------------------------"
echo "---------------------Build Complete----------------------"
echo "---------------------------------------------------------"
echo "----------------Dont do anything illegal-----------------"
echo "---------------------------------------------------------"
echo "--------------------------or-----------------------------"
echo "--------------------S------------------------------------"
echo "-------------------------T-------------------------------"
echo "-------------------------------A-------------------------"
echo "------------------------------------Y--------------------"
echo "-------------------------------A-------------------------"
echo "-------------------------N-------------------------------"
echo "--------------------O------------------------------------"
echo "---------------N-----------------------------------------"
echo "---------Y-----------------------------------------------"
echo "---M-----------------------------------------------------"
echo "---------O-----------------------------------------------"
echo "---------------U-----------------------------------------"
echo "---------------------S-----------------------------------"
echo "---------------------------------------------------------"
