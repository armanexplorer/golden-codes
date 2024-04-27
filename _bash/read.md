---
title: all about read command
---


## read one char to continue

The command `read -n1 -r -p "Press Any Key To Show Commands"` prompts the user to press any key before proceeding. Here's a breakdown of the command:

- `read`: This command reads a line of text from standard input.
- `-n1`: Specifies that only one character should be read.
- `-r`: Prevents backslashes from being interpreted as escape characters.
- `-p "Press Any Key To Show Commands"`: Displays the specified prompt message to the user.

When this command is executed, it will display the message "Press Any Key To Show Commands", and wait for the user to press any key. Once a key is pressed, the script will continue execution. This can be used to pause script execution until user input is received.

## use `<` operator

The `<` operator is used to read the contents of a file:

```bash
val="$(< "myfile.txt")"
```
