---
title: how to change docker0 network and docker bridges ip range
---

[Link](https://serverfault.com/questions/916941/configuring-docker-to-not-use-the-172-17-0-0-range)

Open daemon file:

```bash
sudo nano /etc/docker/daemon.json
```

Add the following json (or append the inner part to the current json)

```jsonc
{
  "bip": "10.200.0.1/24",   // changes the docker0 network range
  "default-address-pools":[ // changes the bridge networks ranges
    {"base":"10.201.0.0/16","size":24},
    {"base":"10.202.0.0/16","size":24}
  ]
}
```

```bash
# update docker daemon
sudo systemctl restart docker

# verify changing in docker0 ip range
ip address show dev docker0

# if you have other networks (e.g., docker composes), run this to verify those too
ip addr | grep 'br-' | grep 'inet'
```
