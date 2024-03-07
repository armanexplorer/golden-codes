---
---

# crontabs

```bash

# system crontabs, will be changed by packages mostly
cat /etc/crontab

# custom system crontabs
cd /etc/cron.d

# add cron job to current user cron jobs
crontab -e

# list the users crontabs
cd /var/spool/cron/crontabs
```
