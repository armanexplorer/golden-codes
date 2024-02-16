---
title: how work with datetime
---

## convert iso str to Tehran timezone datetime

```py
from datetime import datetime
import pytz

date_string = "2024-03-01T11:40:22.639Z"
date_object = datetime.fromisoformat(date_string[:-1]).replace(tzinfo=pytz.utc)

tehran_timezone = pytz.timezone('Asia/Tehran')
date_object_in_tehran = date_object.astimezone(tehran_timezone)

print(date_object_in_tehran)
```
