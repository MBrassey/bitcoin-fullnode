#!/bin/bash

# update and upgrade ubuntu
apt-get update && apt-get upgrade -y

# install build essentials and dependencies
apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 -y
apt-get install libevent-dev libboost-dev libminiupnpc-dev libnatpmp-dev libzmq3-dev libsqlite3-dev -y
apt-get install systemtap-sdt-dev git -y

# install berkeley db for legacy wallet support
apt-get install libdb-dev libdb++-dev -y

# create bitcoin user for running the node
useradd -m -s /bin/bash bitcoin

# set password for the bitcoin user
echo "Please set a password for the 'bitcoin' user:"
passwd bitcoin

# give bitcoin user sudo privileges for necessary commands
echo 'bitcoin ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# instruction to switch to bitcoin user
echo "log in as the 'bitcoin' user and run the second script: 'bitcoin_core_build.sh'"

