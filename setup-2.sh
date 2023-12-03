#!/bin/bash

# variables
BITCOIN_DIR="$HOME/bitcoin"
BITCOIN_CORE_REPO="https://github.com/bitcoin/bitcoin.git"

# clone the latest bitcoin core from the repository
git clone $BITCOIN_CORE_REPO $BITCOIN_DIR
cd $BITCOIN_DIR

# checkout the latest tag (most stable version)
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $latestTag

# configure and build bitcoin core
./autogen.sh
./configure --without-gui
make

# install binaries to /usr/local/bin
sudo make install

# create bitcoin data directory
mkdir -p "$HOME/.bitcoin"

# create a bitcoin configuration file
cat << EOF > $HOME/.bitcoin/bitcoin.conf
server=1
daemon=1
txindex=1
rpcuser=bitcoinrpc
rpcpassword=$(openssl rand -base64 32)
EOF

# create a systemd service to run bitcoin core
cat << EOF | sudo tee /etc/systemd/system/bitcoind.service
[Unit]
Description=Bitcoin Daemon
After=network.target

[Service]
Type=simple
User=bitcoin
Group=bitcoin
ExecStart=/usr/local/bin/bitcoind -conf=$HOME/.bitcoin/bitcoin.conf -datadir=$HOME/.bitcoin -daemon=0 -printtoconsole

[Install]
WantedBy=multi-user.target
EOF

# enable and start the bitcoin service
sudo systemctl daemon-reload
sudo systemctl enable bitcoind
sudo systemctl start bitcoind

echo "bitcoin core is now installed and running."


