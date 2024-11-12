---
title: all about django Command
---

## call a command in code

```py
from django.core.management import call_command
from elasticsearch.helpers import BulkIndexError


try:
    call_command('search_index', *args, *options)
except BulkIndexError as exc:
    self.print_error(exc.errors)
```
