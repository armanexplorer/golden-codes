---
title: how you can have a repo which uses submodules
---

[Docs](https://docs.gitlab.com/ee/ci/git_submodules.html)

[Docs2](https://docs.gitlab.com/ee/ci/runners/configure_runners.html#rewrite-submodule-urls-to-https)

## add to the gitlab ci file

```yaml
variables:
  GIT_SUBMODULE_STRATEGY: recursive
  GIT_SUBMODULE_FORCE_HTTPS: "true"
  GIT_SUBMODULE_DEPTH: 1
```

## enable access to submodeule repo

[Ref](https://forum.gitlab.com/t/submodules-in-ci-cd-not-accessible/82575/2)

You should enable access to the submodule repo for the current repo which want to use it as git submodule


## some example

```bash

git config -f .gitmodules submodule.$UPSTREAM_PROJECT_NAME.branch $UPSTREAM_BRANCH_NAME
git config --file .gitmodules --get-regexp '\.url$' | awk '{print $2}'

git config --file .gitmodules --get-regexp path

git submodule foreach --quiet 'echo $sm_path'

# temp access to submodule project when pipeline is running
(https://gitlab-ci-token:[MASKED]@gitlab.eridanus.ir/propision/ai/property-analytics.git)
(https://gitlab-ci-token:[MASKED]@gitlab.eridanus.ir/propision/ai/property-analytics.git)

https://gitlab-ci-token:[MASKED]@gitlab.eridanus.ir/propision/ai/property-analytics.git
https://gitlab-ci-token:[MASKED]@gitlab.eridanus.ir/propision/ai/property-analytics.git
```
