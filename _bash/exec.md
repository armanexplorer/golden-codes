---
title: how prevent exec from opening new shell
---

# exec --unattended
The empty double quotations `""` in the command `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended` are used to provide an empty argument to the `install.sh` script. In this context, the empty argument is being passed to the script to ensure that it runs in an unattended mode, skipping the interactive prompts that the script may otherwise present. The `--unattended` flag is a common convention in scripts to indicate that the installation should proceed without requiring user input. The empty double quotations serve as a positional parameter, and the `--unattended` flag is a separate argument that follows it.

The use of the empty double quotations in this context is a way to ensure that the `install.sh` script receives an empty argument as expected, and it is a specific requirement of the `install.sh` script in the Oh My Zsh project.

The empty double quotations `""` are not used as part of the `sh -c` command itself, but rather as an argument to the `install.sh` script that is being executed by `sh -c`.

The search results provided did not directly address the specific use of empty double quotations in the context of passing arguments to a script executed with `sh -c`. Therefore, the explanation is based on the common usage and conventions in shell scripting.
