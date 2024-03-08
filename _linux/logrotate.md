---
title: all about log rotaion in linux
---


## config

```bash
cat <<EOF > /etc/logrotate.d/myapp
/path/to/myapp/logs/*.log {
    daily
    rotate 52
    compress
    delaycompress
    notifempty
    missingok
    create 0644 root root
    postrotate
        [ ! -f /var/run/myapp.pid ] || kill -USR1 `cat /var/run/myapp.pid`
    endscript
}
```

## run manual rotation

```bash
# force rotate
logrotate -f /etc/logrotate.d/myapp

# add detaied output
logrotate -vf /etc/logrotate.d/myapp

# run in debug mode (nothing will happen but printing)
logrotate -d /etc/logrotate.d/myapp
```

## multipath

[Ref](https://superuser.com/questions/255951/logrotate-configuration-file-syntax-multiple-wildcard-entries-possible)
