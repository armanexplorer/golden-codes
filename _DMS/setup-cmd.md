---
title: setup script commands
description: the commands which are requeired to define emails, aliaiases and more
---


## add mail account

```bash
docker exec -ti mailserver setup email add info@example.com
```

## add alias

```bash
# add alias as it is popular to do this
docker exec -ti mailserver setup alias add postmaster@example.com admin@example.com

# add alias for matrix.spfbl.net delist (sends delist email to mail.example.com)
docker exec -ti mailserver setup alias add postmaster@mail.example.com admin@example.com
```

## get list of emails

```bash
docker exec -ti mailserver setup email list
```

## add dkim domain

```bash
docker exec -it mailserver setup config dkim domain example.com
```
