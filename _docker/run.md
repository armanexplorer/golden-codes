---
title: docker run flags
---

## docker runtime constraints on resources

[Docs](https://docs.docker.com/engine/reference/run/#runtime-constraints-on-resources)

## docker --rm

In summary, when you pass the `--rm` flag to the docker run command while running a continuous command like python manage.py runserver, the container will be removed when the command is stopped or exits. The `--rm` flag removes the container and its associated file system, but not any volumes that were created or any data that was stored in those volumes.

If you want to remove the volumes associated with the container when it is removed, you can use the `-v` flag along with the `--rm` flag
