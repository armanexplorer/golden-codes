---
title: work with docker images
---

## remove dangle images

```bash
docker images --format "{{.ID}}" --filter "dangling=true" | xargs docker image rm --force
```

[Reference](https://docs.docker.com/engine/reference/commandline/images/)

```bash
docker images --filter "reference=*/project_token"
```

## sort

[Ref](https://www.baeldung.com/linux/docker-sort-images-by-size)

## prune

```bash
# remove all not used and dangled images older than 72h
docker image prune -a --filter "until=72h"
```
