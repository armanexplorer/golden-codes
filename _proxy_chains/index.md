---
title: tunnel commands in termnial
---

[Repo](https://github.com/rofl0r/proxychains-ng)

## install

```bash
# open https://github.com/rofl0r/proxychains-ng/releases/tag/v4.17

# download release
https://github.com/rofl0r/proxychains-ng/releases/download/v4.17/proxychains-ng-4.17.tar.xz

# extract
tar -xzf proxychains-ng-4.17.tar.xz
cd proxychains-ng-4.17

# configure
./configure --prefix=/usr --sysconfdir=/etc

# install
make

# install syste-wide
sudo make install

# installs /etc/proxychains.conf
sudo make install-config
```
