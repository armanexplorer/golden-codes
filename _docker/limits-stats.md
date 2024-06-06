---
title: limit docker resources and watch the live resource usage
---

[Docs](https://www.baeldung.com/ops/docker-memory-limit)

## limit

Using docker run:

```bash
docker run -m 512m --memory-reservation=256m nginx
```

Using docker compose file:

```bash
    deploy:
        resources:
            limits:
              cpus: 0.50 # WARN: this should be float!
              memory: 512M
            reservations:
              cpus: 0.25 # WARN: this should be float!
              memory: 128M
```

## watch

```bash
docker stats
```
