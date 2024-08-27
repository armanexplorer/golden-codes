---
title: migrations in Django
---

## squashmigrations

[Docs](https://docs.djangoproject.com/en/5.0/topics/migrations/#migration-squashing)

```bash
# created combined migration
python manage.py squashmigrations myapp 0001 0005

# apply (commit) migration
python manage.py migrate

# After successfully applying the squashed migration, you can optionally remove the old migration files that were squashed.
# WARNING: DO THIS ONLY IF ALL USERS HAVE BEEN COMMITTED THIS
# python manage.py migrate --prune
```

Once you’ve squashed your migration, you should then commit it alongside the migrations it replaces and `distribute this change` to all running instances of your application, making sure that they run `migrate` to store the change in their database.

You must then `transition` the squashed migration to a `normal migration` by:

- Deleting all the migration files it `replaces`.
- Updating all migrations that `depend` on the deleted migrations to depend on the squashed migration instead.
- Removing the `replaces attribute in the Migration class of the squashed migration` (this is how Django tells that it is a squashed migration).

NOTE: Once you’ve squashed a migration, you should not then re-squash that squashed migration until you have fully `transitioned` it to a `normal migration`.

NOTE: If it is likely that you may `reuse` the name of a deleted migration in the future, you should `remove references` to it from `Django’s migrations table` with the `migrate --prune` option.

## data migrations

[Link](https://docs.djangoproject.com/en/5.1/topics/migrations/#data-migrations)
