---
title: all about shell options
---

- "set -e": Makes the script exit immediately if any command exits with a non-zero status, indicating an error.
- "set -u": Treats unset variables as an error when they are referenced.
- "set -x": Enables debugging mode, causing the shell to print each command before executing it, which is useful for tracing and understanding the script's execution flow.

- "set -o pipefail": Ensures that the script exits with the status of the last command that failed in a pipeline, instead of the status of the last command executed in the pipeline.

Example:

```bash
set +o pipefail # disable pipefail (default)
echo 'hello' | grep 'world' | echo 'Hello World!' # prints `Hello World!`
echo $? # and this will be 0

set -o pipefail # enable pipefail
echo 'hello' | grep 'world' | echo 'Hello World!' # prints `Hello World!` again!
echo $? # but this will be 1
```
