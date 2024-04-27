---
title: all about variables in bash
---

## indirect variable reference

`${!var}`: This is an indirect variable reference. It retrieves the value of the variable whose name is stored in the variable var. For example, if var contains the string "myvar", then `${!var}` is equivalent to `${myvar}`
