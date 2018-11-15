#!/bin/bash

echo "deb http://download.rethinkdb.com/apt `lsb_release -cs` main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list

wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -

sudo apt-get update

sudo apt-get install rethinkdb

sudo apt-get install build-essential protobuf-compiler python libprotobuf-dev libcurl4-openssl-dev libboost-all-dev libncurses5-dev libjemalloc-dev wget m4

wget https://download.rethinkdb.com/dist/rethinkdb-2.3.6.tgz

tar xf rethinkdb-2.3.6.tgz

cd rethinkdb-2.3.6

./configure --allow-fetch

make

sudo make install

cd
mkdir rethinkDB-drivers

echo "--------------------"
echo "C++ RethinkDB Driver"
echo "--------------------"
