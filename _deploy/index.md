---
title: step by step to reproduce a cloud server with docker compose stack
---

[Self-Hosting-Guide](https://github.com/mikeroyal/Self-Hosting-Guide)
[First Debian Server](https://forums.debian.net/viewtopic.php?t=153625)
[Debian SSH](https://wiki.debian.org/SSH)

## update packages

```bash
sudo apt update && apt upgrade -y
```

## configure firewall

[Ref](https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-debian)

```bash
# netstat -tulpn
# lsof -nP -iTCP -sTCP:LISTEN

sudo apt-get install ufw -y

# WANRING: YOU SHOULD ENTER YOUR SSH PORT INSTEAD OF 22 (if it is)
sudo ufw allow proto tcp from any to any port 22

# now it is safe to enable it without losing ssh access!
sudo ufw enable

# CAUTION: set the default policy for output to drop
# sudo ufw default deny outgoing
```

## go for a non-root user

It is better to use only non-root user and disable root login

## create non-root user

```bash
sudo adduser myuser
sudo usermod -aG sudo myuser
su - myuser
```

## copy ssh key

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub $remote_user@$remote_host
```

## set .bashrc and .bash_aliases

## set ssh configs

```bash
# add new configs
cat > /etc/sshd_conf.d/10.conf <<EOF
PasswordAuthentication no)
PermitRootLogin no
EOF

# restart ssh server
service ssh restart
```

## install docker

[Ref](https://docs.docker.com/engine/install/debian/#install-using-the-repository)

## install nginx

```bash
sudo apt update
sudo apt install nginx -y
```

## install certbot

[Ref](https://certbot.eff.org/instructions?ws=nginx&os=debianbuster)

```bash
# install snapd
sudo apt update
sudo apt install snapd

sudo snap install core

sudo snap install --classic certbot

# yes, it is needed!
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

## use certbot to get all certificates of domains

- certbot

## move nginx stuff

- conf.d folder
- /etc/nginx/.htpasswd

## move weedfs data and docker compose

```bash
# add weed to the host
docker cp weedfs-sw_server-1:/usr/bin/weed /usr/bin/

# install fusermount
apt install fuse

# edit the docker compose volume of sw_server
# make the space ready to be taken by sw_mount in its docker-compose
# CAUTION: THERE IS NO NEED TO MAKE ANY CHANGE IN NGINX!

#‌ run containers
docker compose up -d
```

## move apps docker composes

## take backup of databases

```bash
#!/bin/bash

containers=$(docker ps --format '{{.Names}}' --filter "name=db-*")

# Loop through each container and run pg_dump
for container in $containers
do
  echo "Container is: $container";
  docker exec -t $container bash -c 'pg_dump -U $POSTGRES_USER -d $POSTGRES_DB --clean' > /opt/backups/pg_dumps/pg_dump-$container.sql;
done
```

## mirage

## move grafana data

- move `grafana.db` of its volume (or inside the continaer) to new server
- move `grafana.db` to new container volume (or its container)
- set correct permission (`472:root`) for grafana.db inside the volume (or container)

## create gitlab runner

```bash
# install gitlab runner application in new node
docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

# register new runner
- first create new runner from the gitlab instance website
- then:

docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register \
  --url https://example.com  --token xxxxxxxxxxxxxxx

- add something to the config.toml file of gitlab runner
```

## fail2ban

[Ref1](https://www.linuxcapable.com/how-to-install-fail2ban-on-debian-linux/)
