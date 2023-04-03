---
---

# docker system df

The `docker system df` command displays information regarding the amount of disk space used by the docker daemon

## command
```bash
docker system df [--verbose]
```

## output
```log
Images          16        16        7.305GB   929.3MB (12%)
Containers      23        23        131.6MB   0B (0%)
Local Volumes   17        17        2.289GB   0B (0%)
Build Cache     1069      0         50.83GB   50.83GB
```
[Reference](https://docs.docker.com/engine/reference/commandline/system_df/)

# docker buildx prune

```bash
docker buildx prune
```

[Refernece](https://docs.docker.com/engine/reference/commandline/buildx_prune/)

# docker builder prune

```bash
docker builder prune
```

[Reference](https://docs.docker.com/engine/reference/commandline/builder_prune/)