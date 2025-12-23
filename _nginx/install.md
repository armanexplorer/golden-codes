---
title: Install NGINX Using Debian’s Official Repository
---

## Worked in Debian 12

```bash
# required packages
sudo apt update
sudo apt install curl gnupg2 ca-certificates lsb-release

# optional
sudo apt upgrade

curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo gpg --dearmor -o /usr/share/keyrings/nginx-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/debian $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

sudo apt update
sudo apt install nginx

# verify
nginx -v
```
