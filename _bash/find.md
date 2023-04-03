---
title: find hacks
description: some really practical commands with `find`
---

```bash
#‌ check the files in the current directory which have been changed in last 3 days 
find . -mtime -3
```

In the context of the find command, the difference between using + and ; at the end of the command is as follows:
`+`: This is used as a terminator for the -exec option in the find command. When + is used, the command specified by -exec is run once for all the matched files, with the file names appended at the end of the command. This is more efficient than using ; because it avoids launching a new process for each matched file.


`;`: This is also used as a terminator for the -exec option in the find command. When ; is used, the command specified by -exec is run once for each matched file, with the file name substituted for the {} placeholder. This can be less efficient than using + because it launches a new process for each matched file.


Here's an example to illustrate the difference:
```bash
# Using +
find . -name "*.txt" -exec cat {} +

# Using ;
find . -name "*.txt" -exec cat {} ;
```

In the first example, the cat command is run once with all the matched files as arguments, while in the second example, the cat command is run separately for each matched file.
