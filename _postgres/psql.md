---
---

[Ref1](https://www.postgresql.org/docs/current/app-psql.html)

# connect to postgres in docker container 
```bash
# reads the password from ``POSTGRES_PASSWORD`` env var
psql -U db_user -d db_name [-h localhost -p 5432]
```
# some flags
-W
--password 
Force psql to prompt for a password before connecting to a database, even if the password will not be used.

If the server requires password authentication and a password is not available from other sources such as a .pgpass file, psql will prompt for a password in any case. However, psql will waste a connection attempt finding out that the server wants a password. In some cases it is worth typing -W to avoid the extra connection attempt.

Note that this option will remain set for the entire session, and so it affects uses of the meta-command \connect as well as the initial connection attempt.

# dump
```bash
pg_dump dbname > outfile
```

# restore
```bash
psql dbname < infile
```