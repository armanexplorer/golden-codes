---
title: how to write health-checks for docker compose services
---

[Docs](https://docs.docker.com/reference/compose-file/services/#healthcheck)

[Durations Docs](https://docs.docker.com/reference/compose-file/extension/#specifying-durations)

## postgresql image

[ref](https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/)

```yaml
version: '3.9'
services:
  db:
      image: postgres
      restart: always
      environment:
        POSTGRES_PASSWORD: example
    healthcheck:
      test: [“CMD-SHELL”, “pg_isready”]
      interval: 1s
      timeout: 5s
      retries: 10
```

## start_period

Start period provides initialization time for containers that need time to bootstrap. Probe failure during that period will not be counted towards the maximum number of retries. However, if a health check succeeds during the start period, the container is considered started and all consecutive failures will be counted towards the maximum number of retries.

## depends_on

[Docs](https://docs.docker.com/reference/compose-file/services/#depends_on)

## startup-order

[Docs](https://docs.docker.com/compose/how-tos/startup-order/)
