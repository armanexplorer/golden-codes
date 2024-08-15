---
title: all about docker volume command
---

## list dangling volumes (A dangling volume is a volume that is not currently used by any container.)

```bash
docker volume ls -f dangling=true
```

## create a named volume from an anonymous one

- `docker ps -a` to find container identifier
- `docker inspect` on container to find out the anon volume mount point
- `docker volume create <new_volume_name>` to create new named volume
- `docker stop` to stop the container in order to ensure no changes are made to the date while migrating
- `docker cp` to copy the data from container (using the found mount point) to a temporary location on host
- `cp -r / cp` to copy data from host to the created named volume
- update the container configurations to use new named volume
- `docker restart` to restart the container with the new volume mounted

## prune

[Docs](https://docs.docker.com/reference/cli/docker/volume/prune/)

Remove all unused local volumes. Unused local volumes are those which are not referenced by any containers. By default, it only removes anonymous volumes.

`-a`: Remove all unused volumes, not just anonymous ones
