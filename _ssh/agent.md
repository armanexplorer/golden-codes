---
title: Adding ssh key to the ssh-agent
description: If you want to only enter your ssh password one time, ues ssh-agent
---

## add key

Run `ssh-add` on the client machine, that will add the SSH key to the agent.

## list added keys

Confirm with `ssh-add -l` (again on the client) that it was indeed added.

## manual

Here are the steps to list the keys stored in your ssh-agent:

1. First, ensure that the ssh-agent is running and your keys are loaded into it. You can check this by running:

    ```bash
    # fingerprints of all the keys currently loaded in the ssh-agent.
    ssh-add -l
    ```

2. If the above command returns an error saying "Could not open a connection to your authentication agent", you'll need to start the ssh-agent and load your keys into it. You can do this by running:

    ```bash
    eval $(ssh-agent)
    ssh-add
    ```

    The `eval $(ssh-agent)` command starts the ssh-agent and sets the necessary environment variables. The `ssh-add` command then loads your default SSH keys (usually `~/.ssh/id_rsa` and `~/.ssh/id_ed25519`) into the agent.

3. Once your keys are loaded, you can list them again using:

    ```bash
    # fingerprints of all the keys currently managed by the ssh-agent
    ssh-add -l
    ```

    If you want to see the full public key contents instead of just the fingerprints, you can use:

    ```bash
    # full OpenSSH public key format
    ssh-add -L
    ```
