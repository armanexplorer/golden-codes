---
title: how to work with grep
---

```bash
# perl-compatible regex
grep -P '(\d+)'

# extended regex
grep -E ''

# only the matching part
grep -o ''

# print also the next 1 lines and the before 2 lines
grep -A 1 -B 2 ''

# print the lines of context (-C3 print 3 lines BEFORE and AFTER of matching line along with it)
grep -C 3
```

## exclude or include files from grep checking

<https://stackoverflow.com/questions/221921/use-grep-exclude-include-syntax-to-not-grep-through-certain-files>

```bash
grep -r --exclude-dir="\.svn" "pattern" *
```
