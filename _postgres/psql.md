---
title: how to work with Postgres Client
---

[Ref1](https://www.postgresql.org/docs/current/app-psql.html)

## connect to postgres in docker container

```bash
# reads the password from ``POSTGRES_PASSWORD`` env var
psql -U db_user -d db_name [-h localhost -p 5432]
```

## some flags

-W
--password
Force psql to prompt for a password before connecting to a database, even if the password will not be used.

If the server requires password authentication and a password is not available from other sources such as a .pgpass file, psql will prompt for a password in any case. However, psql will waste a connection attempt finding out that the server wants a password. In some cases it is worth typing -W to avoid the extra connection attempt.

Note that this option will remain set for the entire session, and so it affects uses of the meta-command \connect as well as the initial connection attempt.

## dump

```bash
pg_dump dbname > outfile
```

## restore

```bash
psql dbname < infile
```

## inspect tables and columns

```bash
# inspect table fields
\d table_name

# inspect specific field
SELECT pg_typeof(table_field) FROM table_name LIMIT 1;
```

## see unique constraints of a table

Simply run:

```bash
# find table name
\d

# see the uniques along with other info of table
\d table_name
```

### second method

```bash
# find the table name
\d

SELECT conname AS constraint_name
FROM pg_constraint
JOIN pg_class ON conrelid = pg_class.oid
WHERE relname = 'table_name'
AND contype = 'u';
```

## remove a unique constraint from a table

```bash
ALTER TABLE cart DROP CONSTRAINT cart_shop_user_id_key;
```

## add unique constraint to a table

```bash
ALTER TABLE table_name
ADD CONSTRAINT unique_column1_column2 UNIQUE (column1, column2);
```
