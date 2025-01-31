# bitcoin-fullnode
These Bitcoin Fullnode Automation scripts are intended to build from source and fully install the Bitcoin Core full-node implementation on Ubuntu.

## Installation
- run setup_1.sh as root user
```
apt install vim -y
vim setup_1.sh
[paste setup_1.sh]
chmod +x setup_1.sh
./setup_1.sh
```
- run setup_2.sh as bitcoin user
```
su - bitcoin
vim setup_2.sh
[paste setup_2.sh]
chmod +x setup_2.sh
./setup_2.sh
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
