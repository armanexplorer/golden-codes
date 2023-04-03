---
title: get custom config lines
description: how we can get the already edited lines of a config file?
---

```bash
# get the custom lines (uncommented lines) from a file with empty lines removed
grep -v '^#' gitlab.rb | sed '/^\s*$/d'
```