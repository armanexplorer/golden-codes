---
title: all about git pull
---

## pull from local

```bash
# pull from master (it is equal to `git fetch . master && git merge FETCH_HEAD`)
git pull . master

# OR merge with master
git merge master

# OR rebase with master (maybe prevent extra commmit)
git rebase master
```
