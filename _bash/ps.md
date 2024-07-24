---
title: all about ps tool
---

- `ps auxf`: This displays a full listing of all processes on the system. The options used are:
    - `a`:  Select all processes except both session leaders (see getsid(2)) and processes not associated with a terminal.
    - `u`: Display the process's user/owner
    - `x`: Show processes not attached to a terminal
    - `f`: Do full-format listing, showing the command line arguments
    - `e`: Select all processes. Identical to -A.

The `ps` command is a versatile tool in Linux for viewing information about running processes. Here's how you can use it to get details about process status:

**Basic Usage:**

By default, `ps` displays information about the processes associated with your current terminal session. It provides a limited set of columns:

```bash
$ ps
  PID TTY          TIME CMD
 18756 pts/0    00:00:00 bash
 20146 pts/0    00:00:00 ps
```

- **PID (Process ID):** Unique identifier for each process.
- **TTY (Terminal):** Terminal the process is associated with (e.g., pts/0).
- **TIME:** Total CPU time used by the process in hours:minutes:seconds format.
- **CMD (Command):** Name of the command that launched the process.

**Getting More Information:**


- **`-a` (all processes):** Lists all processes running on the system, including those of other users.
- **`-e` (equivalent to `-a`):** Lists all processes.
- **`-f` (full format):** Displays a more comprehensive set of information about each process, including:
    - **USER:** Username of the process owner.
    - **%CPU:** Percentage of CPU time the process is using.
    - **%MEM:** Percentage of memory the process is using.
    - **VSZ:** Virtual memory size of the process.
    - **RSS:** Resident Set Size (amount of physical memory used).
    - **STAT:** Process status (e.g., R - running, S - sleeping, Z - zombie).
    - **START:** Time the process started.
    - **WCHAN:** Event or resource the process is waiting for.
    - **COMMAND:** Full command line used to launch the process.

**Examples:**

```bash
# List all processes with full format
$ ps -f

# List processes owned by user "root"
$ ps -u root

# Filter processes by name (shows only the first matching process)
$ ps -C firefox

# Show processes with high CPU usage (use top or htop for a more interactive view)
$ ps -eo pid,%cpu --sort=-%cpu | head -5
```

**Process Status Codes:**

The `STAT` column in the full format output displays a single-character code indicating the process status. Here are some common codes:

- **R:** Running
- **S:** Sleeping (waiting for CPU)
- **D:** Uninterruptible sleep (waiting for I/O)
- **T:** Stopped (signal received)
- **Z:** Zombie (dead process, waiting for parent to collect)
- **<:** High-priority process

**Further Exploration:**

The `ps` command offers a wide range of options for filtering and formatting its output. Refer to the `man ps` command in your terminal for a complete list of options and their descriptions. Tools like `top` and `htop` provide a more interactive and visually appealing way to monitor processes in real-time.
