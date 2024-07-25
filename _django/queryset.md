---
title: QuerySet lookups and methods
---

[Docs](https://docs.djangoproject.com/en/5.0/ref/models/querysets/)

## select_related

[Docs](https://docs.djangoproject.com/en/5.0/ref/models/querysets/#select-related)

Returns a QuerySet that will “follow” foreign-key relationships, selecting additional related-object data when it executes its query. This is a performance booster which results in a single more complex query but means later use of foreign-key relationships won’t require database queries.

You can refer to any ForeignKey or OneToOneField relation in the list of fields passed to select_related().

If you need to clear the list of related fields added by past calls of select_related on a QuerySet, you can pass None as a parameter:

```py
without_relations = queryset.select_related(None)
```

Chaining select_related calls works in a similar way to other methods - that is that select_related('foo', 'bar') is equivalent to select_related('foo').select_related('bar').

### Plain Lookup

```py
# Hits the database.
e = Entry.objects.get(id=5)

# Hits the database again to get the related Blog object.
b = e.blog
```

### select_related lookup

```py
# Hits the database.
e = Entry.objects.select_related("blog").get(id=5)

# Doesn't hit the database, because e.blog has been prepopulated
# in the previous query.
b = e.blog
```

## prefetch_related

[Docs](https://docs.djangoproject.com/en/5.0/ref/models/querysets/#prefetch-related)

- Returns a QuerySet that will automatically retrieve, in a single batch, related objects for each of the specified lookups.

- prefetch_related, on the other hand, does a separate lookup for each relationship, and does the ‘joining’ in Python.

- The additional queries in `prefetch_related()` are executed after the QuerySet has begun to be evaluated and the primary query has been executed.

### Prefetch() objects

[Docs](https://docs.djangoproject.com/en/5.0/ref/models/querysets/#prefetch-objects)

```py
class Prefetch(lookup, queryset=None, to_attr=None)
```

The Prefetch() object can be used to control the operation of prefetch_related().
