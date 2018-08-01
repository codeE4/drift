#!/bin/bash

#Photon
cd /root/
git clone https://gitlab.acceleratefoundation.io/root/photon.git
cd photon
cd cli
npm install
npm link

#Base-Image
cd /root/
git clone https://github.com/codeE4/base-image.git
photon container --create
lxc stop base --force
lxc publish base --alias=base
lxc delete base --force

#Lab
cd /root/
git clone https://github.com/codeE4/lab.git

