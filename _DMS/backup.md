---
title: how to back my mailserver up
---


```bash
tar --gzip -cf "backup-$(date +%F).tar.gz" ./docker-data/dms
tar --gzip -xf backup-date.tar.gz
```
