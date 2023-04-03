---
---

pg_dump -U admin <db_name> > backup

pg_dump -U admin --column-inserts --data-only <db_name> > inserts.sql


## `--clean`:
To drop and recreate tables, you could use the --clean command-line option for pg_dump to emit SQL commands to clean (drop) database objects prior to (the commands for) creating them. (This will not drop the whole database, just each table/sequence/index/etc. before recreating them.)

## -F flag
The `-F` option in `pg_dump` is used to specify the format of the output file. It allows you to choose the format in which the dump will be written. The supported formats include `p` (plain-text SQL), `c` (custom), `d` (directory), and `t` (tar). For example, to create a custom-format dump, you can use the following command:

```bash
# custom
pg_dump -F c -f database.dump dbname

# tar and then gzip
pg_dump -U admin -F t <db_name> | gzip >/backups/my_db-$(date +%Y-%m-%d).tar.gz
```

This will create a custom-format dump of the `dbname` database and write it to the `database.dump` file. The custom format is a compressed archive that can only be read by `pg_restore`.

For more information, you can refer to the official PostgreSQL documentation for `pg_dump`[1].

[1] https://www.postgresql.org/docs/7.0/app-pgdump.htm

Citations:
[1] https://www.postgresql.org/docs/7.0/app-pgdump.htm
[2] https://www.postgresql.org/docs/devel/static/app-pgdump.html
[3] https://dba.stackexchange.com/questions/286128/what-is-the-correct-way-to-make-an-exact-copy-of-a-database-with-pg-dump
[4] https://stackoverflow.com/questions/63020646/postgresql-pg-dump-for-a-single-table
[5] https://github.com/orgs/supabase/discussions/3464