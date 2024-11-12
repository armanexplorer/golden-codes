---
title: enable ssl connection for postgresql
---

## create certs

```bash
mkdir -p ./postgres-certs
openssl req -new -x509 -days 365 -nodes -text -out ./postgres-certs/server.crt -keyout ./postgres-certs/server.key
chmod 600 ./postgres-certs/server.key

# or using a simple script (https://github.com/lstellway/self-signed-ssl)
```

## add volume and config permission

```yaml
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_USER: your_user
      POSTGRES_PASSWORD: your_password
      POSTGRES_DB: your_database
    volumes:
      - ./postgres-data:/var/lib/postgresql/data
      - ./postgres-data/certs:/etc/postgresql/certs
    ...
```

```bash
# on host
docker compose -it postgres bash

# on container
chown postgres:postgres /etc/postgresql/certs/server.crt
chown postgres:postgres /etc/postgresql/certs/server.key
```

## add the flags to postgres command to support SSL

```yaml
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_USER: your_user
      POSTGRES_PASSWORD: your_password
      POSTGRES_DB: your_database
    volumes:
      - ./postgres-data:/var/lib/postgresql/data
      - ./postgres-data/certs:/etc/postgresql/certs
    ports:
      - "5432:5432"
    command: >
      postgres -c ssl=on
               -c ssl_cert_file=/etc/postgresql/certs/server.crt
               -c ssl_key_file=/etc/postgresql/certs/server.key
  your_service:
    image: your_service_image
    environment:
      # pragma: allowlist nextline secret
      DATABASE_URL: "postgresql://your_user:your_password@postgres:5432/your_database?sslmode=require"
    depends_on:
      - postgres
```

## test

```bash
# on host
docker compose -it postgres bash

# on container
psql "postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost:5432/$POSTGRES_DB?sslmode=require"
```
