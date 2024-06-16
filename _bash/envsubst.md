---
title: expand varibales in a file or text
---

`envsubst` is a Unix command-line utility that substitutes environment variables with their corresponding values in a given text or file. Here are the key points about `envsubst`:

- It takes a template file or text as input, and replaces placeholders like `$VARIABLE` or `${VARIABLE}` with the actual values of those environment variables.

- The basic usage is `envsubst < input_file` which reads the input file, substitutes variables, and prints the result to stdout.

- You can redirect the output to a file using `envsubst < input_file > output_file`.

- The `-v` or `--variables` option lists all the variables referenced in the input, without performing substitution.

- You can specify a subset of variables to substitute using the `SHELL-FORMAT` argument, e.g. `envsubst '$VAR1 $VAR2' < input_file`.

- It is particularly useful for templating configuration files, scripts, or any text that needs to be dynamically populated with environment-specific values.

In summary, `envsubst` is a simple yet powerful tool for variable substitution, making it easier to manage and deploy applications or configurations across different environments.
