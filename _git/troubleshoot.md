---
title: commands to troubleshoot git problems
---

[Docs](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables#_debugging)

[Gitlab Docs](https://docs.gitlab.com/ee/topics/git/troubleshooting_git.html)

```bash
GIT_SSH_COMMAND="ssh -i ~/.ssh/gitlabadmin" git <command>

# git over ssh
GIT_SSH_COMMAND="ssh -vvv" git clone <git@url>

# git over https
GIT_TRACE_PACKET=1 GIT_TRACE=2 GIT_CURL_VERBOSE=1 git clone <url>
```
