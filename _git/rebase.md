---
layout: default
title: Git Rebase
description: An intro to git rebase and its best practices
---

# Intro ([Atlassian])

Git rebase in standard mode will automatically take the commits in your current working branch and apply them to the head of the passed branch.

```bash
git rebase <base>
```

This automatically rebases the current branch onto `＜base＞`, which can be any kind of commit reference (for example an ID, a branch name, a tag, or a relative reference to HEAD).

# Git pull `--rebase` vs. `--merge` ([SDQ-Wiki])

This page briefly explains the difference between rebasing and merging in git while pulling. Both techniques are used to combine your local unpublished changes with the published remote changes.

## rebasing
If you pull remote changes with the flag `--rebase`, then your local changes are reapplied on top of the remote changes.
```bash
git pull --rebase
```
## merging
If you pull remote changes with the flag `--merge`, which is also the default, then your local changes are merged with the remote changes. This results in a merge commit that points to the latest local commit and the latest remote commit.
```
git pull --merge
```

## best practice
<b>It is best practice to always rebase your local commits when you pull before pushing them. As nobody knows your commits yet, nobody will be confused when they are rebased but the additional commit of a merge would be unnecessarily confusing. Published commits are, however, usually merged, for example when branches are merged.</b>

To avoid typing `--rebase` whenever you pull you can config git to use it as default:
```
git config --global pull.rebase true
```
If you want to combine local commits before pushing them upstream, for example, because you discovered a typo or bug after a commit, you can do this interactively:
```
git rebase -i
```

# Advanced rebase application ([Atlassian])
The command line argument `--onto` can be passed to `git rebase`. When in git rebase `--onto` mode the command expands to:
```
git rebase --onto <newbase> <oldbase>
```
The `--onto` command enables a more powerful form of rebase that allows passing specific refs to be the tips of a rebase.
Let’s say we have an example repo with branches like:

```
   o---o---o---o---o  main
        \
         o---o---o---o---o  featureA
              \
               o---o---o  featureB
```
`featureB` is based on `featureA`, however, we realize `featureB` is not dependent on any of the changes in `featureA` and could just be branched off main.
```
git rebase --onto main featureA featureB
```
`featureA` is the `＜oldbase＞` and `main` becomes the `＜newbase＞`. Also, `featureB` is reference for what `HEAD` of the `＜newbase＞` will point to. The results are then:
```
                      o---o---o  featureB
                     /
    o---o---o---o---o  main
         \
          o---o---o---o---o  featureA
```

[Atlassian]: https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase

[SDQ-Wiki]: https://sdq.kastel.kit.edu/wiki/Git_pull_--rebase_vs._--merge