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

[Docs](https://docs.docker.com/reference/cli/docker/image/prune/)

```bash
# remove all not used and dangled images older than 72h
docker image prune -a --filter "until=72h"

# Also, you can add it to crontab
# At 04:30 on Friday each week
30 4 ** 5 docker image prune -a --filter "until=168h"
```
