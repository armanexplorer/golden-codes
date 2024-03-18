---
title: what is select_for_update 
---

Returns a queryset that will lock rows until the end of the transaction, generating a `SELECT ... FOR UPDATE SQL` statement on supported databases.

Django’s `select_for_update` will release the lock when the outermost transaction it is inside gets committed

Locks in `PostgreSQL` are granted to a database `connection`

[Docs](https://docs.djangoproject.com/en/5.0/ref/models/querysets/#select-for-update)

[Exmaple](https://medium.com/@alexandre.laplante/djangos-select-for-update-with-examples-and-tests-caff09414766)
