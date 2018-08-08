# Drift

### Overview
```
An open sourced bash script library
```
### Initial Setup
```
clone Drift
chmod +x *.sh
```
### Manual Setup --- Doing the following steps

### Photon Setup(if you want it)
```
Clone Photon:

git clone https://gitlab.acceleratefoundation.io/root/photon.git
cd photon
cd cli
npm install
sudo npm link
which photon (should be /usr/local/bin/photon)
```

### Install LXC with snapd(if you want it)
```
sudo apt install snapd
snap install lxd
lxd init
```

### Create base LXC image
```
git clone https://github.com/codeE4/base-image.git
cd base-image
photon container --create
lxc stop base --force
lxc publish base --alias=base
lxc delete base --force
```

### Drift Setup
```
Clone Drift: 

git clone https://github.com/codeE4/drift.git

Pick a target
ex. Google

cd drift
chmod +x start.sh
./start.sh
```

