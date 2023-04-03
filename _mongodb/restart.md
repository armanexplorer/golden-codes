---
---


# fail after start
[Referece](https://askubuntu.com/questions/823288/mongodb-loads-but-breaks-returning-status-14)

```bash
sudo chown -R mongodb:mongodb /var/lib/mongodb
sudo chown mongodb:mongodb /tmp/mongodb-27017.sock

sudo service mongod restart

```
