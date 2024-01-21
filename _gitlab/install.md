---
title: CLI base commands
descriptions: CLI base commands in postgres
---

```bash
# set GITLAB_HOME environment
export GITLAB_HOME=/srv/gitlab

# our isntllation
sudo docker run --detach \
 --hostname gitlab.eridanus.ir \
 --publish 6521:443 --publish 6520:80 --publish 22:22  \
 --name gitlab \
 --restart always \
 --volume $GITLAB_HOME/config:/etc/gitlab \
 --volume $GITLAB_HOME/logs:/var/log/gitlab \
 --volume $GITLAB_HOME/data:/var/opt/gitlab \
 --shm-size 256m \
  gitlab/gitlab-ee:latest


# exmpale
sudo docker run --detach \
  --hostname example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest
```
