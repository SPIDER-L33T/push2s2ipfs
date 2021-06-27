# push2s2ipfs

This is "Push Static Sites (2S) To(2) IPFS" - easy script for automatised pushing static site to IPFS

## Preparing to work

Place the script on your local PC on which IPFS daemon is running.

**Or** place the script in the home directory on the dedicated server or VPS ([For example $5 per month Digital Ocean Droplet](https://m.do.co/c/f4e31f99f562)) on which IPFS daemon is running.

### How run IPFS

Download **go-ipfs** from https://dist.ipfs.io/

For example:
```bash
wget https://dist.ipfs.io/go-ipfs/v0.9.0/go-ipfs_v0.9.0_linux-amd64.tar.gz
tar -xvzf go-ipfs_v0.9.0_linux-amd64.tar.gz
cd go-ipfs
sudo bash install.sh
ipfs init
```
Make service script:
```bash
sudo cat <<EOT >> /lib/systemd/system/ipfs.service
sudo cat <<EOT >> test
[Unit]
Description=IPFS daemon
After=network.target
[Service]
User=$USER
ExecStart=/usr/local/bin/ipfs daemon --enable-pubsub-experiment --enable-namesys-pubsub
[Install]
WantedBy=multiuser.target
EOT
systemctl enable ipfs
systemctl start ipfs
```


## Using
```bash
bash push2s2ipfs.sh path_to_dir_with_site_files/
```

Examples:
```bash
bash push2s2ipfs.sh www.mydiy.eu/
```
or

First launch:
```bash
chmod +x push2s2ipfs.sh
./push2s2ipfs.sh www.mydiy.eu/
```
Subsequent launches:
```bash
./push2s2ipfs.sh www.mydiy.eu/
```

or

```bash
scp -r www.mydiy.eu pipka@7.1.1.104
ssh -t pipka@7.1.1.104 './push2s2ipfs.sh www.mydiy.eu/'
```
```
