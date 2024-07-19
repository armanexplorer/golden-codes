---
title: all types of expansion
---

## substring expansion

`${1:0:1}`: This is a substring expansion. It extracts a substring from $1, starting from the 0th character (the first character) and with a length of 1 character.

## param expansion

[Docs](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)

[Good Ref](https://tecadmin.net/bash-parameter-expansion/)

[Other ref](https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html)

Note: we can use `:` (colon, bash built-in command) to do nothing and be a placeholder to allow the expansion of the variable in the next command:

```bash
: "${POSTGRES_HOST_AUTH_METHOD:=}"
```

### shell substitution example

**`${x:=y}` (Assign if unset):**

* If the variable `x` is unset or empty, this substitution assigns the value `y` to `x` **and** expands to the value `y`.
* If `x` is already set (even to an empty string), it expands to the current value of `x`.

**`${x:-y}` (Default if unset):**

* If the variable `x` is unset or empty, this substitution simply expands to the value `y`.
* It does **not** modify the value of `x` in any way.
* If `x` is already set (even to an empty string), it expands to the current value of `x`.

Here's a table summarizing the behavior:

| Scenario                 | `${x:=y}` | `${x:-y}` |
|--------------------------|-----------|-----------|
| `x` is unset or empty    | Assigns `y` to `x`, expands to `y` | Expands to `y` |
| `x` is set (even to "")  | Expands to current value of `x` (might overwrite with `y` for `:=`) | Expands to current value of `x` |

**Choosing the right substitution:**

* Use `${x:=y}` when you want to both set a default value and use it in the expansion. This is useful for initializing variables before using them.
* Use `${x:-y}` when you only need a default value for the expansion and don't want to modify the variable itself.
