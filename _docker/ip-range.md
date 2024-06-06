---
title: how to change docker ip range
---

```bash
# change daemon file
sudo nano /etc/docker/daemon.json

{
    "bip": "192.168.1.1/24" # 172.10.0.1/24 resolved my problem for conflict with some network!
}
```

```bash
# update docker daemon
sudo systemctl restart docker
```

```bash
# verify changeing in ip range
ip address show dev docker0
```
