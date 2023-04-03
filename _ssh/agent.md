---
title: Adding ssh key to the ssh-agent
description: If you want to only enter your ssh password one time, ues ssh-agent
---

# add key
Run `ssh-add` on the client machine, that will add the SSH key to the agent.

# list added keys
Confirm with `ssh-add -l` (again on the client) that it was indeed added.