---
title: all tricks about sed
---

## append after a line using sed

The command `sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config` will insert the line `Port 143` after the line containing `Port 22` in the file `/etc/ssh/sshd_config`. Here's a breakdown of the command:

- `sed`: Stream editor for filtering and transforming text.
- `-i`: In-place editing. It edits files in place instead of writing to standard output.
- `'/Port 22/a Port 143'`: This part of the command uses a sed command to append (`a`) the line `Port 143` after (`/Port 22/`) the line containing `Port 22`.
- `/etc/ssh/sshd_config`: The file path where the changes will be made, in this case, it's the SSH server configuration file.

By running this command, you are instructing `sed` to find the line with `Port 22` in `/etc/ssh/sshd_config` and add a new line `Port 143` after it. This can be useful for changing or adding configuration options in files without manually editing them.
