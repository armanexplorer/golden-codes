---
title: shared memory (RAM) on /dev/shm
---

# shm in docker and docker compose
[Ref](https://bobcares.com/blog/docker-shm-size/)

Docker shm size refers to the amount of shared memory allotted to a docker container. A Docker /dev/shm is a temporary file storage filesystem using RAM for storing files. It also facilitates inter-process communication (IPC). However, it’s optional to have a shared memory device.

```bash
docker run -it --shm-size=256m oracle11g /bin/bash
```
```yaml
version: "3.8"
services:
  functionsappservice:
    build:
      context: .
      shm_size: "2gb" <-- used during the build
      dockerfile: Dockerfile
    shm_size: "2gb" <-- used during the run
    image: name:latest <-- name to be used when pushing to the Hub
```
[Ref](https://gist.github.com/SecretLake/45f75073f4916862a628f26babfb5eaf)
[Ref](https://stackoverflow.com/questions/30210362/how-to-increase-the-size-of-the-dev-shm-in-docker-container)