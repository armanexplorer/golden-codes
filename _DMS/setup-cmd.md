---
title: setup script commands
description: the commands which are requeired to define emails, aliaiases and more
---


# add mail account
```bash
docker exec -ti mailserver setup email add info@example.com
```

# get list of emails
```bash
docker exec -ti mailserver setup email list
```

# add dkim domain
```bash
docker exec -it mailserver setup config dkim domain example.com
```