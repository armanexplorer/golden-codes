---
title: all about schemas in postgresql
---

## information_schema

```bash
SELECT data_type
FROM information_schema.columns
WHERE table_name = 'orders'
  AND column_name = 'order_date';
```

This query will return the data type of the order_date column. You can also use information_schema to get information about other database objects, such as tables, views, indexes, and constraints.
