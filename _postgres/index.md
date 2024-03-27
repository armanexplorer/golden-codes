---
title: basic concepts about PostgreSQL
---

## schema definition

In PostgreSQL, a schema is a namespace that contains named database objects such as tables, views, indexes, data types, functions, stored procedures, and operators[1][2]. A database contains one or more named schemas, which in turn contain tables. The same object name can be used in different schemas without conflict; for example, both schema1 and myschema can contain tables named mytable[1]. By default, PostgreSQL automatically creates a schema called public for every new database. Whatever object you create without specifying the schema name, PostgreSQL will place it into this public schema[2]. Therefore, the following statements are equivalent: CREATE TABLE table_name( ... ); and CREATE TABLE public.table_name[ ... ](2).

Citations:
[1] <https://www.postgresql.org/docs/current/ddl-schemas.html>
[2] <https://www.postgresqltutorial.com/postgresql-schema/>

## schema vs. database

A database is a **physical container** that encapsulates multiple schemas and provides a way to manage and access them, while a schema is a **logical container** within a database, used to organize and segregate database objects for effective data management

## create read-only user

[Ref1](https://stackoverflow.com/questions/760210/how-do-you-create-a-read-only-user-in-postgresql)
