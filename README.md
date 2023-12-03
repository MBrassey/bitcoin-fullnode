# bitcoin-fullnode
These Bitcoin Fullnode Automation scripts are intended to build from source and fully install the bitcoin core full-node implementation.

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
- check on bitcoin.service
```
journalctl -u bitcoin.service -f
```
- query current blockheight
```
bitcoin-cli getblockcount
```
