# Drift

### Overview
```
An open sourced hacking tool written in c++
```

### Photon setup
```
Clone Photon:

git clone https://gitlab.acceleratefoundation.io/root/photon.git
cd photon
cd cli
npm install
sudo npm link
which photon (should be /usr/local/bin/photon)
```

### Install LXC with snapd
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

### Drift setup
```
Clone Drift: 

git clone https://github.com/codeE4/drift.git

Pick a target
ex. Google

cd drift
chmod +x start.sh
./start.sh
```

