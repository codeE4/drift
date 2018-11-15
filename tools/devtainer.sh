#!/bin/bash

echo "---------------------------------------------------------"
echo "-------------------Creating a development----------------"
echo "---------------------------------------------------------"
echo "---------------------Container for you-------------------"
echo "---------------------------------------------------------"


#Photon
echo "---------------------------------------------------------"
echo "------------------Installing Photon----------------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root
rm -rf photon
git clone https://gitlab.acceleratefoundation.io/root/photon.git
cd photon
cd tools
./ubuntu-node-install
npm install
cd ..
cd cli
npm install
sudo npm link

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
no
yes
default
btrfs
yes
no
15
no
yes
lxdbr0
auto
auto
no
yes
no

EOF

/snap/bin/lxd init < /root/.lxd-answers.txt

#Nginx-Setup

photon environment --nginx-setup

#Base-Image

echo "---------------------------------------------------------"
echo "------------------Installing Base Image------------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root
rm -rf base-image
git clone https://github.com/codeE4/base-image.git
cd base-image
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
