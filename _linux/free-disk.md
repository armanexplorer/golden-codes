---
title: how you can find large and unnecessary files
---

[ChatGPT Chat](https://chatgpt.com/share/674875d1-0e28-8005-97d0-b35499ccc3fa)

```bash
# list main directories and their size
sudo du -h --max-depth=1 /

# list sub-directories of a main directory
sudo du -h --max-depth=1 /var


# ncdu
sudo apt update
sudo apt install ncdu
sudo ncdu /

# list logs
sudo du -h /var/log

# clear logs
sudo truncate -s 0 /var/log/*.log
sudo journalctl --vacuum-size=100M

# clean cache
sudo apt clean

# list and clean old images and unused containers
docker system df
docker system prune -af

# clean temporary files
sudo rm -rf /tmp/*

# clean unused packages
sudo apt autoremove --purge
sudo apt clean

# find large files
sudo find / -type f -size +500M -exec ls -lh {} \;
```
