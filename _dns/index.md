---
---

[BIND Install](https://www.linuxbabe.com/ubuntu/set-up-local-dns-resolver-ubuntu-20-04-bind9)

# install systemd resolve (re-configure it if it has been installed but not activated)
```bash
sudo apt update
sudo apt install systemd-resolved
sudo systemctl start systemd-resolved
sudo systemctl enable systemd-resolved
```