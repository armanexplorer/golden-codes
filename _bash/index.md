---
title: general information and hacks
---

[Docs](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/)

## ./script.sh VS source ./script.sh

In Linux, there is a difference between running a script using `./script.sh` and `source ./script.sh`.

- When you run a script using `./script.sh`, it is executed in a subshell. This means that any environment changes, such as variable assignments, made by the script will not be visible to the parent shell.
- On the other hand, when you run a script using `source ./script.sh` or `. ./script.sh`, the script is executed in the current shell. This allows the script to make changes to the current shell's environment, such as modifying variables or changing the current directory.

The main difference lies in how they affect the current shell's environment. Using `source` (or `.`) is typically used when you want the script to make changes to the current shell, such as setting environment variables, while running the script with `./script.sh` creates a separate subshell and any environment changes made by the script are confined to that subshell.

It's important to note that `source` is a Bash built-in command, so it will only work if the script is being run by a Bash shell. If you want your script to be portable across different shells, you should use the `.` (dot) notation instead of `source`.

## import functions from a shell script

This could be avoided by [like this](https://stackoverflow.com/questions/63301843/is-it-possible-to-source-a-bash-script-to-load-its-functions-without-executing-i). But if you wnat to do that anyway, this is the way:

[Ref](https://stackoverflow.com/questions/12815774/importing-functions-from-a-shell-script)

```bash
#!/bin/bash

foo () { ... }
bar () { ... }

main() {
    code
}

# the `BASH_SOURCE` is the executers array (0=Current, 1=Sourcer, 2=Sourcer of Sourcer, ...)
if [[ "${#BASH_SOURCE[@]}" -eq 1 ]]; then
    main "$@"
fi
```

The expression `${#BASH_SOURCE[@]}` in Bash is used to obtain the number of elements in the `BASH_SOURCE` array. The `BASH_SOURCE` array contains the source filenames where the corresponding shell function names in the FUNCNAME array variable are defined. It is particularly useful when a script is being sourced, as it provides the source filenames of the executing script and its callers. This information can be used, for example, to **determine if the script is being directly executed or being sourced from another script**.

