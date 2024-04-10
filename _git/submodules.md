---
title: Git submodules
description: How we can make use of it?
---

[Reference](https://stackoverflow.com/questions/1030169/pull-latest-changes-for-all-git-submodules)

```bash
#‌ If it's the first time you check-out a repo you need to use --init first:
git submodule update --init --recursive

# For git 1.8.2 or above, the option --remote was added to support updating to latest tips of remote branches:
git submodule update --recursive --remote
```

## clear remove of submodule

[Link](https://stackoverflow.com/questions/41718822/how-to-resolve-fatal-not-a-git-repository)
