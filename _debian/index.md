---
title: major settings
---

# change language shortcut

Keyboard -> Keyboard Shortcuts -> Switch to next input source

# get rid of `Processing triggers for man-db` taking too long time

## method 1 (remove auto-update to prevent rebuild cache)
The Processing triggers for man-db step is only executed if the file /var/lib/man-db/auto-update exists. This is an empty file with the sole purpose of controlling this behavior, so it can be safely removed to disable this time-consuming and arguably unnecessary process.
[Ref](https://askubuntu.com/questions/272248/processing-triggers-for-man-db)

# method 2 (upgrade man-db)
This bug was fixed in the package man-db - 2.10.0-2
[Ref](https://bugs.launchpad.net/ubuntu/+source/man-db/+bug/1858777/comments/9)

# method 3 (remove man-db)
```bash
sudo apt-get remove --purge man-db
```
[Ref](https://stackoverflow.com/questions/76607092/google-compute-engine-processing-triggers-for-man-db-2-9-4-2-it-takes-a)

# method 4 (config man-db to not re-build cache)
```bash
echo "set man-db/auto-update false" | sudo debconf-communicate && sudo dpkg-reconfigure man-db
```

# method 5 (re-index man-db cache)

```bash
sudo rm -rf /var/cache/man
sudo mandb -c
```
[Ref](https://thelinuxuser.com/fix-processing-triggers-for-man-db/)