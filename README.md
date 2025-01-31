# bitcoin-fullnode
These Bitcoin Fullnode Automation scripts are intended to build from source and fully install the Bitcoin Core full-node implementation on Ubuntu.

## Installation
- run setup.sh as root user
```
apt install vim -y
vim setup.sh
[paste setup.sh]
chmod +x setup.sh
./setup.sh
```
- run setup-2.sh as bitcoin user
```
su - bitcoin
vim setup-2.sh
[paste setup-2.sh]
chmod +x setup-2.sh
./setup-2.sh
```
- check on bitcoind.service
```
sudo journalctl -u bitcoind.service -f
```
- query current blockheight
```
bitcoin-cli getblockcount
```
- query blockchain status
```
bitcoin-cli getblockchaininfo
```
