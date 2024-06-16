---
---


# define the important flags

- journalctl `-e`: This option shows the most recent journal entries and jumps to the end of the log, allowing you to easily view the latest messages. This is equivalent to using the `--pager-end` option.

- journalctl `-u`: This option filters the output to show only the logs for a specific systemd unit. You can specify the unit name as an argument, such as journalctl -u nginx.service to view the logs for the Nginx service. This is equivalent to using the `--unit` option.

- journalctl `-x`: This option adds more information to the output, including the full message and the source file and line number where the message was generated. This is equivalent to using the `--full` option.

## summary

| Option | Description | Equivalent Double-Dash Flag |
| ------ | ----------- | --------------------------- |
| `-e`   | Show the most recent journal entries and jump to the end of the log | `--pager-end` |
| `-u`   | Filter the output by a specific systemd unit | `--unit` |
| `-x`   | Add more information to the output, including the full message and source file/line number | `--full` |

## filter

[Docs](https://net2.com/how-to-analyze-linux-systemd-logs-using-journalctl-advanced-filtering-options/)

The --since and --until options accept various time formats:

```bash
journalctl --since "2024-06-12 12:00:00" --until "2024-06-12 14:00:00"
```

```bash
journalctl --since "2 hours ago"
```

Additionally, you can combine these options with other filters like --unit to filter for a specific systemd unit, or -p to filter by log priority level:

```bash
journalctl --since "1 hour ago" -u sshd -p err
```
