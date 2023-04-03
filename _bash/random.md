---
---

```bash
tr -cd "[:alnum:]" < /dev/urandom | fold -w 20 | sed 10q
```