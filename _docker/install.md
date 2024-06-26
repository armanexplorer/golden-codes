---
title: install docker engine
---

## Install Docker CE

We have two methods:

### using script

[Docs](https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script)

```bash
curl -L https://get.docker.com | sh
```

### Setup docker apt repository

[Docs](https://docs.docker.com/engine/install/debian/#install-using-the-repository)


#### Add Docker's official GPG key

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

#### Add the repository to Apt sources

```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

### Install docker packages

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Upgrade docker packages

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## use docker with non-root user

[Docs](Ihttps://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)

## configure root-less docker (security topics)

[Docs](https://docs.docker.com/engine/security/rootless/)

## configure free mirror

Open `/etc/docker/daemon.json` and enter the following there (Only use if you are in force):


```json
{
  "registry-mirrors": ["https://docker.arvancloud.ir"]
}
```
