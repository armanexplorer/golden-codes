---
title: all about mac address in linux
---

## change mac address

```bash
sudo apt install macchanger
# enter the No for every new wifi (default choice)

# find your network interface card name
ip link

# turn your wifi down

# keep the manufacturer (3 first two digits) and only change the last 3 ones
sudo macchanger -e wlp3s0

# or set fully random one
sudo macchanger -r wlp3s0

# turn your wifi up
```
