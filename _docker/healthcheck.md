---
---

# postgresql image
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
