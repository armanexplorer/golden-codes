---
title: apt hacks
---


## only upgrade one package

```bash
sudo apt-get install --only-upgrade man-db
```

## DEBIAN_FRONTEND=noninteractive

Example:

```bash
DEBIAN_FRONTEND=noninteractive apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-ce-rootless-extras docker-buildx-plugin >/dev/null
```
