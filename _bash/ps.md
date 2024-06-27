---
title: all about ps tool
---

- `ps auxf`: This displays a full listing of all processes on the system. The options used are:
    - `a`:  Select all processes except both session leaders (see getsid(2)) and processes not associated with a terminal.
    - `u`: Display the process's user/owner
    - `x`: Show processes not attached to a terminal
    - `f`: Do full-format listing, showing the command line arguments
    - `e`: Select all processes. Identical to -A.
