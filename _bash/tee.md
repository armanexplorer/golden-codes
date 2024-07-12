---
title: duplicate the output stream
---

Example of duplicating some parts of output stream:

```bash
echo 'this is the first line\nthis is second output' | tee >(head -n 1) | grep 'second'
```
