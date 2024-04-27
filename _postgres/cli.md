---
title: CLI base commands
descriptions: CLI base commands in postgres
---

## show unique constraints of a table

```sql
SELECT conname FROM pg_constraint WHERE conrelid = 'your_table_name'::regclass AND contype = 'u';
```

## show table defintion

```bash
\d your_table_name
```

## show verbose table definitoin

```bash
\d+ your_table_name
```

## remove unique contraint

```sql
ALTER TABLE your_table_name DROP CONSTRAINT constraint_name;
```

## create and drop db

```bash
dropdb db_name
createdb db_name
```

### force drop db

dropdb db_name --force
