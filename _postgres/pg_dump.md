---
---

[Doc](https://www.postgresql.org/docs/current/app-pgdump.html)

# -a or --data-only
Dump only the data, not the schema (data definitions). Table data, large objects, and sequence values are dumped.

# -F format or --format=format
Selects the format of the output. format can be one of the following:

## p or plain
Output a plain-text SQL script file (the default).

## c or custom
Output a custom-format archive suitable for input into pg_restore. Together with the directory output format, this is the most flexible output format in that it allows manual selection and reordering of archived items during restore. This format is also compressed by default.

## d or directory
Output a directory-format archive suitable for input into pg_restore. This will create a directory with one file for each table and large object being dumped, plus a so-called Table of Contents file describing the dumped objects in a machine-readable format that pg_restore can read. A directory format archive can be manipulated with standard Unix tools; for example, files in an uncompressed archive can be compressed with the gzip, lz4, or zstd tools. This format is compressed by default using gzip and also supports parallel dumps.

## t or tar
Output a tar-format archive suitable for input into pg_restore. The tar format is compatible with the directory format: extracting a tar-format archive produces a valid directory-format archive. However, the tar format does not support compression. Also, when using tar format the relative order of table data items cannot be changed during restore.

# -j njobs or --jobs=njobs
Run the dump in parallel by dumping njobs tables simultaneously. This option may reduce the time needed to perform the dump but it also increases the load on the database server. You can only use this option with the directory output format because this is the only output format where multiple processes can write their data at the same time.


# -Z level -Z method[:detail] or --compress=level --compress=method[:detail]
Specify the compression method and/or the compression level to use. The compression method can be set to gzip, lz4, zstd, or none for no compression. A compression detail string can optionally be specified. If the detail string is an integer, it specifies the compression level. Otherwise, it should be a comma-separated list of items, each of the form keyword or keyword=value. Currently, the supported keywords are level and long.

If no compression level is specified, the default compression level will be used. If only a level is specified without mentioning an algorithm, gzip compression will be used if the level is greater than 0, and no compression will be used if the level is 0.

For the custom and directory archive formats, this specifies compression of individual table-data segments, and the default is to compress using gzip at a moderate level. For plain text output, setting a nonzero compression level causes the entire output file to be compressed, as though it had been fed through gzip, lz4, or zstd; but the default is not to compress. With zstd compression, long mode may improve the compression ratio, at the cost of increased memory use.

The tar archive format currently does not support compression at all.

# examples
some examples with pg_dump
```bash
# dump SQL-script (plan-text) format and load it into fresh db
pg_dump mydb > db.sql
psql -d newdb -f db.sql

# To dump a single table named mytab:
pg_dump -t mytab mydb > db.sql

# To dump all tables whose names start with emp in the detroit schema, except for the table named employee_log:
pg_dump -t 'detroit.emp*' -T detroit.employee_log mydb > db.sql

# To dump all schemas whose names start with east or west and end in gsm, excluding any schemas whose names contain the word test:
pg_dump -n 'east*gsm' -n 'west*gsm' -N '*test*' mydb > db.sql
pg_dump -n '(east|west)*gsm' -N '*test*' mydb > db.sql # using regex

# To dump all database objects except for tables whose names begin with ts_:
pg_dump -T 'ts_*' mydb > db.sql

# custom fomrat
pg_dump -Fc mydb > db.dump

# To reload an archive file into a (freshly created) database named newdb:
pg_restore -d newdb db.dump

# To reload an archive file into the same database it was dumped from, discarding the current contents of that database:
pg_restore -d postgres --clean --create db.dump

# directory format
pg_dump -Fd mydb -f dumpdir
pg_dump -Fd mydb -j 5 -f dumpdir

```
## tar format and then gzip
pg_dump -U db_user -F t db_name | gzip >/backups/$(date +%Y-%m-%d-%H-%M-%S)/db_name-.tar.gz

## plain text sql format
pg_dump -U db_user db_name > /backups/$(date +%Y-%m-%d-%H-%M-%S)/db_name-.sql