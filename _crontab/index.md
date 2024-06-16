---
title: all about crontab
---

## intro

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

## check logs

[Docs](https://blog.healthchecks.io/2023/01/using-logs-to-troubleshoot-failing-cron-jobs/)

```bash
journalctl -t CRON --since "today"

journalctl -t CRON --since "3 days ago"
```
