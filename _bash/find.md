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

## some example

```bash
find . -maxdepth 1 -type f -name "*.sql" -delete
```

## about -mtime

The `-mtime` option in the `find` command is used to search for files based on their modification time. The `+1` argument specifies that the files should have been modified more than 1 day ago.

Here's the meaning of `-mtime +1`:

- `-mtime` - This option specifies that the search should be based on the modification time of the files.
- `+1` - The `+` sign indicates "greater than". So `+1` means "more than 1 day ago".

In other words, `-mtime +1` will match files that were last modified more than 24 hours ago (i.e. at least 2 days ago).

Some examples:

- `find . -mtime +1 -print` - Find all files in the current directory and subdirectories that were modified more than 1 day ago and print their paths.

- `find /var/log -mtime +7 -exec rm {} \;` - Find all files under `/var/log` that were modified more than 7 days ago and delete them.

- `find /home -user john -mtime +30 -type f` - Find all regular files owned by user "john" under `/home` that were modified more than 30 days ago.

The `-mtime` option can also use `-` to match files modified less than N days ago, and no sign to match files modified exactly N days ago.

So in summary, `-mtime +1` is a very useful option to find files that haven't been modified recently based on a specified number of days
