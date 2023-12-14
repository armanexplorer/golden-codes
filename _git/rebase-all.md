---
title: how to rebase all commits to only one commit
---

```bash
# first enter this
git rebase -i --root

# in the opened list of commits, do this:
pick    c1
squash  c2
squash  c3
.
.
.
squash  cN

# then save the file and close
...

# enter the commit message for the newly created commit from squishing c1 to cN-1
Ex. feat(init): init of project

# then save the file and close
...

# the `git log` should be like this (only this commit):
feat(init): init of project
```