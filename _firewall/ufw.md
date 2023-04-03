---
title: how to work with apps in ufw
description: interseting codes to make use of apps feature of ufw
---

[UFW on Debian](https://www.zenarmor.com/docs/network-security-tutorials/how-to-set-up-a-firewall-with-ufw-on-debian)

```bash
# block outgoing TCP traffic to destination port 80 for the country with the country code "IR" (Iran)
sudo ufw deny out proto tcp to any port 80 geoip country IR
```

```bash
# Get the list of UFW app profiles
app_list=$(sudo ufw app list | sed '1d')

# Loop through each app profile and show its info
while IFS='  ' read -r app; do
    echo "App: $app"
    ufw app info "$app" | grep -P '(\d+$|\d+[/tcp|/udp|,])'
    echo "------------------------"
done <<< "$app_list"
```