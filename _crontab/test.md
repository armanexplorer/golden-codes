---
title: how we can test our crons
---

[Link](https://stackoverflow.com/questions/8132355/test-run-cron-entry)

We use some script which can be named `run-as-cron` which can be written in two ways:

## method 1 (exec)

```bash
#!/bin/sh

. "$1"
exec /usr/bin/env -i "$SHELL" -c ". $1; $2"
```

**Line 3: exec /usr/bin/env -i "$SHELL" -c ". $1; $2"**

* This line uses the `exec` command, which replaces the current running process with a new process. Here's what it does:
    * `/usr/bin/env`: This specifies the `env` program, which is used to set the environment variables for the new process.
    * `-i`: This flag tells `env` to create a new environment for the following command, instead of inheriting the current environment.
    * `"$SHELL"`: This expands to the user's default shell (like `/bin/bash` or `/bin/zsh`).
    * `-c`: This flag tells `env` to interpret the following string as a command.
    * `". $1; $2"`: This is the command string that will be executed within the new shell environment.
        * `. $1`: This sources the same configuration file again.
        * `;`: This separates the two commands within the string.
        * `$2`: This expands to the second argument provided to the script.

## method 2 (exec setid)

```bash
#!/bin/sh

. "$1"
exec setsid /usr/bin/env -i "$SHELL" -c "set -a; . $1; $2" </dev/null
```

Then we should run it:

```bash
chmod +x run-as-cron
./run-as-cron <cron-environment> <command>

# example
./run-as-cron /home/username/cron-env 'echo $PATH'
```

`setsid`: This is prepended before the exec command. It creates a new session for the following process, making it independent of the current terminal session.

`</dev/null`: This redirects the standard input (stdin) of the new process to /dev/null, which is a special file that discards any data written to it. This effectively isolates the new process from any input coming from the terminal.

`New session`: The setsid creates a new session, which can be useful for isolating the child process from the parent script's session. This can be helpful if the script needs to run in the background or doesn't require interaction with the current terminal.

`No standard input`: Redirecting stdin to /dev/null prevents the child process from taking input from the keyboard. This can be useful if the script doesn't require any user interaction.
