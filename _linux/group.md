---
title: how to work with groups in linux
---

## check the members of a group

The group information, including members, is stored in the /etc/group file.

```bash
grep '^sudo:.*$' /etc/group | cut -d: -f4

# or

getent group sudo
```
