---
---

[ref](https://spacelift.io/blog/docker-secrets)

[Secrets](https://docs.docker.com/compose/compose-file/09-secrets/)

[Secrets in Docker Compose](https://docs.docker.com/compose/use-secrets/)

# add secret to postgres
```bash
echo "your_password" | docker secret create pg_pass_secret -
```
```yaml
version: '3.1'
services:
  postgres:
    image: postgres
    environment:
      POSTGRES_PASSWORD_FILE: /run/secrets/postgres_password_secret
    secrets:
      - postgres_password_secret
secrets:
  postgres_password_secret:
    external: true
```
