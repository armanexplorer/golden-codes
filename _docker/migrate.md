---
title: migrate docker data
---

```bash
sudo systemctl stop docker
ps faux | grep -i docker # check any docker is running

sudo nano /opt/docker/daemon.json
{
    "data-root": "/data/docker"
}

sudo rsync -avxP /home/docker/ /data/docker
sudo systemctl daemon-reload
sudo systemctl start docker

sudo mv /data/docker /data/docker.old
```

## sample daemon config file

```json
{
"log-driver": "json-file",
"log-opts": {
    "max-size": "10m",
    "max-file": "3"
    },
"data-root": "/home/docker"
}
```
