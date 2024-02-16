---
title: how we should work with dig?
---

[Docs](https://www.baeldung.com/linux/check-ptr-records)

## get PTR from IP (without reversing)

```bash
# be sure the +short is before the -x !
dig +short -x <IP_ADDRESS>
```
