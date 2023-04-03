---
title: Postfix Installation
descriptions: step by step guide to install Postfix
---

```bash
# MAYBE NEEDED
create role postfixadmin_user with password 'PostfixAdmin2025!!!!';

# Docker engine
docker run \
-e POSTFIXADMIN_DB_TYPE=pgsql \
-e POSTFIXADMIN_DB_HOST=database \
-e POSTFIXADMIN_DB_USER=postfixadmin_user \
-e "POSTFIXADMIN_DB_PASSWORD=PostfixAdmin2025!!!!" \
-e POSTFIXADMIN_DB_NAME=postfixadmin_db \
-e "POSTFIXADMIN_SETUP_PASSWORD=PostfixAdminWeb2025!!!!" \
-e POSTFIXADMIN_SMTP_PORT=587 \
--name postfixadmin \
-p 8888:80 \
--add-host=database:172.17.0.1 \
postfixadmin

# test postifx user is OK
psql -h <host> -p 5432 -U postfixadmin_user -d database
```