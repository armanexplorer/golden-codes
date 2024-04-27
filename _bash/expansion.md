---
title: all types of expansion
---

## substring expansion

`${1:0:1}`: This is a substring expansion. It extracts a substring from $1, starting from the 0th character (the first character) and with a length of 1 character.

## param expansion

[Docs](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)

[Good Ref](https://tecadmin.net/bash-parameter-expansion/)

[Other ref](https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html)

Note: we can use `:` (colon, bash built-in command) to do nothing and be a placeholder to allow the expansion of the variable in the next command:

```bash
: "${POSTGRES_HOST_AUTH_METHOD:=}"
```
