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

## revert migration

[Practical Doc](https://sentry.io/answers/django-revert-last-migration/)

[Full Doc](https://docs.djangoproject.com/fr/5.1/topics/migrations/#reversing-migrations)

You can reverse a migration using the `migrate` command with the number of the previous migration.

Let’s say you have an app called `recipes`.

You can see a list of all the migrations in the migrations folder or by running the following command:

```bash
python manage.py showmigrations recipes
```

You may have the following migrations in your recipes app:

- `0001_initial.py`
- `0002_recipepage.py`
- `0003_recipeindex.py`

If you want to undo the `0003_recipeindex` migration, you can do it like so:

```bash
python manage.py migrate recipes 0002_recipepage

# or shorter
python manage.py migrate recipes 0002
```

Make sure that everything is working the way it should, then you can delete `0003_recipeindex.py`.

If you want to reverse all migrations for your app, you can use the name zero, like so:

```bash
python manage.py migrate recipes zero
```

Keep in mind that certain irreversible operations can make a migration irreversible. If you try to reverse an irreversible migration, you will get an `IrreversibleError`.
