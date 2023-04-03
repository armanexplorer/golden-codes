---
---

[Reference](https://www.freedesktop.org/software/systemd/man/systemd.unit.html)

# Drop-in editing ExecStart or other parsed-as-list entries
Note that for drop-in files, if one wants to remove entries from a setting that is parsed as a list (and is not a dependency), such as AssertPathExists= (or e.g. ExecStart= in service units), one needs to first clear the list before re-adding all entries except the one that is to be removed. Dependencies (After=, etc.) cannot be reset to an empty list, so dependencies can only be added in drop-ins. If you want to remove dependencies, you have to override the entire unit.
