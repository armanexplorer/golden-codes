---
title: all about pg_restore
---

[Docs](https://www.postgresql.org/docs/current/app-pgrestore.html)

## If you want recreate the production database as a dev one then do

```bash
pg_restore -C --no-owner --no-acl --clean --if-exists -d postgres dump_file.dump
```

The `-C` with `--clean` will `DROP DATABASE db_name` and then rebuild it from scratch by connecting to the database postgres to do the `DROP/CREATE db_name` and then connect to `db_name` to load the rest of the objects.

## -c or --clean

Before restoring database objects, issue commands to `DROP` all the objects that will be restored. This option is useful for overwriting an existing database. If any of the objects do not exist in the destination database, ignorable error messages will be reported, unless `--if-exists` is also specified.

The `pg_restore --clean` option is used to clean (drop) existing database objects before restoring the database from the archive. When this option is specified, `pg_restore` will issue commands to drop existing objects such as tables, indexes, and other database elements before restoring the database from the archive. This ensures that the database is restored to a clean state without any existing objects that may conflict with the objects being restored from the archive.

```bash
pg_restore --clean -d dbname archivefile
```

## -C or --create

Create the database before restoring into it. If `--clean` is also specified, drop and recreate the target database before connecting to it.

With --create, pg_restore also restores the database's comment if any, and any configuration variable settings that are specific to this database, that is, any `ALTER DATABASE ... SET ...` and `ALTER ROLE ... IN DATABASE ... SET ...` commands that mention this database. Access privileges for the database itself are also restored, unless `--no-acl` is specified.

When this option is used, the database named with `-d` is used only to issue the initial `DROP DATABASE` and `CREATE DATABASE` commands. All data is restored into the database name that appears in the archive.

## --if-exists

Use `DROP ... IF EXISTS` commands to drop objects in `--clean` mode. This suppresses “does not exist” errors that might otherwise be reported. This option is not valid unless `--clean` is also specified.

## -a or --data-only

Restore only the data, not the schema (data definitions). `Table data`, `large objects`, and `sequence values` are restored, if present in the archive.

## --exit-on-error

Exit if an error is encountered while sending SQL commands to the database. The default is to continue and to display a count of errors at the end of the restoration.

## -1 or --single-transaction

Execute the restore as a single transaction (that is, wrap the emitted commands in BEGIN/COMMIT). This ensures that either all the commands complete successfully, or no changes are applied. This option implies `--exit-on-error`.

## -l or --list

List the table of contents of the archive. The output of this operation can be used as input to the `-L` option. Note that if filtering switches such as `-n` or `-t` are used with `-l`, they will restrict the items listed.

## -O or --no-owner

Do not output commands to set ownership of objects to match the original database. By default, pg_restore issues `ALTER OWNER` or `SET SESSION AUTHORIZATION` statements to set ownership of created schema elements. These statements will fail unless the initial connection to the database is made by a superuser (or the same user that owns all of the objects in the script). With -O, any user name can be used for the initial connection, and **this user will own all the created objects**

## -j number-of-jobs or --jobs=number-of-jobs

Run the most time-consuming steps of pg_restore — those that load data, create indexes, or create constraints — concurrently, using up to number-of-jobs concurrent sessions. This option can dramatically reduce the time to restore a large database to a server running on a multiprocessor machine. This option is ignored when emitting a script rather than connecting directly to a database server.

Each job is one process or one thread, depending on the operating system, and uses a **separate connection** to the server.

The optimal value for this option depends on the hardware setup of the server, of the client, and of the network. Factors include the `number of CPU cores` and the `disk` setup. A good place to start is the `number of CPU cores` on the server, but values larger than that can also lead to faster restore times in many cases. Of course, values that are too high will lead to decreased performance because of thrashing.

Only the `custom` and `directory` archive formats are supported with this option. The input must be a `regular file` or `directory` (not, for example, a pipe or standard input). Also, multiple jobs **cannot** be used together with the option `--single-transaction`.

## examples

```bash
# simple
pg_dump -Fc mydb > db.dump

# existing db
dropdb mydb
pg_restore -C -d postgres db.dump

# create and load into new db
createdb -T template0 newdb
pg_restore -d newdb db.dump

# select only some db itmes to restore
pg_restore -l db.dump > db.list
nano db.list # make change to only choose some of items
pg_restore -L db.list db.dump
```
