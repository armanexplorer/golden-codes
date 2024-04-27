---
title: Git submodules
description: How we can make use of it?
---

[Good Intro](https://www.atlassian.com/git/tutorials/git-submodule)

## update vs sync

[Link](https://stackoverflow.com/questions/45678862/git-submodule-update-vs-git-submodule-sync)

[Sync Docs](https://git-scm.com/docs/git-submodule#Documentation/git-submodule.txt-sync--recursive--ltpathgt82308203)

**Update**: git submodule update updates the contents of the submodules. It is effectively running a "git fetch" and "git checkout" in each of your submodules.

**Sync**: git submodule sync updates the metadata about a submodule to reflect changes in the submodule URL. It re-synchronizes the information in .git/config with the information in .gitmodules.

## update options

[Reference](https://stackoverflow.com/questions/1030169/pull-latest-changes-for-all-git-submodules)

```bash
#‌ If it's the first time you check-out a repo you need to use --init first:
git submodule update --init --recursive

# For git 1.8.2 or above, the option --remote was added to support updating to latest tips of remote branches:
git submodule update --recursive --remote
```

## clear remove of submodule

[Link](https://stackoverflow.com/questions/41718822/how-to-resolve-fatal-not-a-git-repository)

## add two differnet branch of a repo

```bash
git submodule add -b <branch A> --name <name A> <url> <path A>
git submodule add -b <branch B> --name <name B> <url> <path B>
```
