---
title: change a run-time parameter with set
---

- `set -E`
Enables the ERR trap to be inherited by shell functions, command substitutions, and commands executed in a subshell environment

- `set -e`
Makes the script exit immediately if any command exits with a non-zero status, indicating an error.

- `set -u`:
Treats unset variables as an error when they are referenced.

- `set -x`
Enables debugging mode, causing the shell to print each command before executing it, which is useful for tracing and understanding the script's execution flow.

- `set -o pipefail`: Ensures that the script exits with the status of the last command that failed in a pipeline, instead of the status of the last command executed in the pipeline.

Example:

```bash
#!/bin/bash

set -E

trap 'echo "An error occurred!"' ERR

some_function() {
  echo "Inside the function"
  some_command_that_fails
}

some_command_that_fails
```

```bash
set +o pipefail # disable pipefail (default)
echo 'hello' | grep 'world' | echo 'Hello World!' # prints `Hello World!`
echo $? # and this will be 0

set -o pipefail # enable pipefail
echo 'hello' | grep 'world' | echo 'Hello World!' # prints `Hello World!` again!
echo $? # but this will be 1
```

## change positional params

```bash
set -- postgres "$@"
```

This command patches `postgres` argument as the first positional argument along the existing ones (`$@`)

**set --**: This part is specific to the shell scripting language (like Bash). It clears any existing positional parameters (arguments passed to the script) and sets the following arguments as new positional parameters.

**postgres**: This is likely the actual command to be executed, which is probably the psql client for interacting with PostgreSQL.

**"$@"**: This expands to all the arguments that were originally passed to the script itself.
