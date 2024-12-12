---
title: how to install and upgrade rocketchat servser
---


## install on debian

[Docs](https://docs.rocket.chat/deploy/deploy-rocket.chat/additional-deployment-methods/deploy-on-debian)

[Update docs](https://docs.rocket.chat/docs/updating-rocketchat)

```bash
sudo apt -y update
# sudo apt -y upgrade

sudo apt install -y curl build-essential graphicsmagick

curl -L https://releases.rocket.chat/latest/download -o /tmp/rocket.chat.tgz
tar xzf /tmp/rocket.chat.tgz -C /tmp

# WARNING: you should ensure this is running with the required node version (mostly 14.21.3)
# Solution: install this node version in `rocketchat` user and run the following with that user
sudo chown -R rocketchat:rocketchat /tmp/bundle
sudo su - rocketchat
(cd /tmp/bundle/programs/server; npm i)
exit

systemctl stop rocketchat

# if some old version exists, back it up first!
sudo mv /opt/Rocket.Chat /opt/old-Rocket.Chat

# prepare new version
sudo mv /tmp/bundle /opt/Rocket.Chat
sudo chown -R rocketchat:rocketchat /opt/Rocket.Chat

systemctl start rocketchat
```

## check node and mongodb versions

[Docs](https://docs.rocket.chat/setup-and-configure/environment-configuration/check-node.js-version)

- Release Page -> <https://github.com/RocketChat/Rocket.Chat/releases>
- API -> <https://releases.rocket.chat/6.3.0/info> or <https://releases.rocket.chat/latest/info>

Use like this:

```bash
curl https://releases.rocket.chat/latest/info -s | jq '.nodeVersion' -r
```

- see `.node_version.txt` file at the root of `bundle`

## install with docker

[Docs](https://docs.rocket.chat/deploy/deploy-rocket.chat/deploy-with-docker-and-docker-compose)

## backup and restore

[Docs](https://docs.rocket.chat/setup-and-configure/environment-configuration/mongodb-configuration/mongodb-backup-and-restore)

[Mongodump](https://www.mongodb.com/docs/database-tools/mongodump/)

[Mongorestore](https://www.mongodb.com/docs/database-tools/mongorestore/)

```bash
mongodump --gzip --archive=pathDatabase.gz
mongorestore --gzip --archive=pathDatabase.gz
```

- You can back up a specific database by adding the `--db Database` option to the `mongodump` command.
- You can back up a specific collection by adding the `--collection collectionName` option to `mongodump`.
- When restoring, you can use the `--drop` option to drop the database before restoring.
- If using authentication, you need to include the `--username` and `--authenticationDatabase` options.
