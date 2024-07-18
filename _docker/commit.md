---
title: create docker image from container
---

[Docs](https://docs.docker.com/reference/cli/docker/container/commit/)

It can be useful to commit a container's file changes or settings into a new image. This lets you debug a container by running an interactive shell, or export a working dataset to another server.

**Commits do not include any data contained in mounted volumes**.

By default, the container being committed and its processes **will be paused** while the image is committed. This reduces the likelihood of encountering data corruption during the process of creating the commit. If this behavior is undesired, set the `--pause` option to `false` (by default is `true`).

## one example

```bash
# get ubuntu image and run it
docker run -t -i ubuntu /bin/bash

# create a new directory there
touch /TEST

exit

# create an image from the last conatiner created
docker commit $(docker ps -lq) test-image

# deploy it to registry
docker tag test-image your_domain/test-image
docker push your_domain/test-image
```
