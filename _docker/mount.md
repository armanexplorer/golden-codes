---
title: all about mount in docker
---

## mount types

[Docker Volumes (new style)](https://docs.docker.com/storage/volumes/)

[Docker Bind Mount (old style)](https://docs.docker.com/storage/bind-mounts/)

[In Memory Mount](https://docs.docker.com/storage/tmpfs/)

## print container mounts

```bash
docker inspect mycontainer --format '{{ json .Mounts }}'
```

## Back up, restore, or migrate data volumes

```bash
# source container
docker run -v /dbdata --name dbstore ubuntu /bin/bash

# backup
docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata

# create new container and restore
docker run -v /dbdata --name dbstore2 ubuntu /bin/bash
docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"
```

**--strip 1**: It tells tar to **remove one leading directory level from the filenames** during extraction.
