---
title: work with ethtool
---

## check the interface is virtual or not

If it returns a true physical mac address, it is physical (not virtual)

```bash
ethtool -P eth0
```

## list of virtula devices

```bash
ls -a /sys/devices/virtual/net
```
