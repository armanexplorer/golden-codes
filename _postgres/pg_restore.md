---
---

# --clean flag
The `pg_restore --clean` option is used to clean (drop) existing database objects before restoring the database from the archive. When this option is specified, `pg_restore` will issue commands to drop existing objects such as tables, indexes, and other database elements before restoring the database from the archive. This ensures that the database is restored to a clean state without any existing objects that may conflict with the objects being restored from the archive.

For example, the following command uses the `--clean` option to drop existing objects before restoring the database from the archive:

```bash
pg_restore --clean -d dbname archivefile
```

This command will drop existing objects in the `dbname` database before restoring the database from the `archivefile` archive.

The `--clean` option is useful when you want to ensure that the database is restored to a clean state without any existing objects that may interfere with the restoration process.

For more information, you can refer to the official PostgreSQL documentation for `pg_restore`[1].

[1] https://www.postgresql.org/docs/current/app-pgrestore.html

Citations:
[1] https://www.postgresql.org/docs/current/app-pgrestore.html
[2] https://stackoverflow.com/questions/42481346/pg-restore-clean-is-not-dropping-and-clearing-the-database
[3] https://dba.stackexchange.com/questions/317560/pg-restore-error-when-using-the-single-transaction-options-c-clean-and-a
[4] https://postgrespro.com/list/thread-id/2476189
[5] https://simplebackups.com/blog/postgresql-pgdump-and-pgrestore-guide-examples/