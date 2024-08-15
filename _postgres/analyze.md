---
title: analyze queries in postgresql
---


[Dcos](https://www.postgresql.org/docs/current/sql-analyze.html)

## EXPLAIN and `pg_pretty_print`

In the following example, the output will show you the execution plan, including the number of rows processed, the time spent on each operation, and other details.

```bash
EXPLAIN ANALYZE
SELECT customer_id, AVG(total_amount) AS average_order_value
FROM orders
GROUP BY customer_id;

# install it as an extension
CREATE EXTENSION pg_pretty_print;

SELECT pg_pretty_print.print_explain_analyze(
    'EXPLAIN ANALYZE SELECT * FROM orders WHERE order_date BETWEEN \'2023-01-01\' AND \'2023-12-31\';'
);
```

## EXPLAIN (VERBOSE) and `pg_pretty_print`

```bash
EXPLAIN (VERBOSE) SELECT * FROM orders WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';

SELECT pg_pretty_print.print_explain_analyze(
    'EXPLAIN (VERBOSE) SELECT * FROM orders WHERE order_date BETWEEN \'2023-01-01\' AND \'2023-12-31\';'
);

```
