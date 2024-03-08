---
title: all about NetworkManger; network management daemon
---

The NetworkManager daemon attempts to make networking configuration and operation as painless and automatic as possible by managing the primary network connection and other network interfaces, like Ethernet, Wi-Fi, and Mobile Broadband devices.

## change DNS tyep and nameservers

[Ref](https://askubuntu.com/questions/907246/how-to-disable-systemd-resolved-in-ubuntu/907249#907249)

```bash
# change DNS type
sed -i 's/^dns=.*$/dns=default/' /etc/NetworkManager/NetworkManager.conf

# or possiblty you can create a conf to override in /etc/NetworkManager/conf.d

# change default servsers (set after each restarting NetworkManager)
nmcli connection modify <connection_name> ipv4.dns <dns_server1> <dns_server2>

# restart NetworkManager and check the /etc/resolv.conf is what you want
sudo systemctl restart NetworkManager
```
