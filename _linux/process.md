---
title: working with processes in Linux
---

## de-attach process from shell

There are a couple of ways to SSH into a Linux server, run a process, and detach it from the SSH session:

**1. Using tmux:**

*  tmux is a terminal multiplexer that allows you to create multiple virtual terminal sessions within a single physical terminal.
*  Connect to the server using SSH.
*  Start a tmux session by typing `tmux`.
*  Run your desired process inside the tmux session.
*  Detach from the tmux session by pressing `Ctrl + b` followed by `d`. This will leave your process running in the background even after you exit the SSH session.
*  To re-attach to the tmux session later, simply run `tmux attach`.

**2. Backgrounding and Disowning:**

* Connect to the server using SSH.
* Run the command to start your process.
*  Press `Ctrl + Z` to suspend the process.
*  Use the `bg` command to send the suspended process to the background and resume its execution.
*  Run the `disown [pid]` command (where `pid` is the process ID) to detach the process from the current shell session. This will ensure the process continues to run even after you exit the SSH session.
* You can check running background jobs with the `jobs` command.

**3. Using nohup:**

*  Connect to the server using SSH.
*  Run your process with `nohup <command> &`.
*  `nohup` ensures the process continues to run even if the terminal session is disconnected. The `&` symbol sends the process to the background.

Remember, choosing the right method depends on your specific needs and preferences.

### using disown

Example:

```bash
jupyter notebook --no-browser & disown

# in zsh (&! is zsh built-in function that does the same as & disown)
jupyter notebook --no-browser &!

jupyter notebook & >> disown
```

### using nohup

```bash
nohup jupyter notebook --no-browser &
```

### compare nohup and disown

## Disown vs. nohup: Detaching Processes from SSH

Both `disown` and `nohup` help you run a process on a remote server via SSH and keep it running even after you disconnect your SSH session. However, they achieve this in different ways:

**disown:**

* **Focus:** Job Control (Shell Specific)
* **Functionality:**
    * Removes the process from the current shell's job list.
    * Prevents the shell from sending a HUP (hangup) signal to the process if the shell exits.
* **Limitations:**
    * Only works with background processes (started with `&`).
    * Not all shells support `disown`.
    * Doesn't handle standard input (stdin), standard output (stdout), or standard error (stderr).
* **Usage:**

```bash
ssh server_name  # Connect to server
my_long_process &  # Run the process in background
disown %1          # Disown the last background job (replace %1 with actual job number if needed)
```

**nohup:**

* **Focus:** Process Independence
* **Functionality:**
    * Runs the command independently of the controlling terminal.
    * Ignores the HUP signal (like `disown`).
    * Redirects `stdin` to `/dev/null` (ignores input).
    * By default, redirects `stdout` and `stderr` to a file named `nohup.out` in your home directory on the server.
* **Usage:**

```bash
ssh server_name  # Connect to server
nohup my_long_process &  # Run the process with nohup and background it
```

**Choosing Between disown and nohup:**

* **Use disown if:**
    * You only need to prevent the shell from sending HUP on exit.
    * You want to manage stdout and stderr yourself.
    * Your shell supports `disown`.
* **Use nohup if:**
    * You need to redirect `stdin`, `stdout`, and `stderr`.
    * You want a simpler approach without worrying about shell compatibility.

**Additional Notes:**

* `nohup` can also be used in the foreground (without `&`) to make a process ignore the HUP signal.
* You can specify output files for `nohup` like this: `nohup my_process > my_output.log 2>&1 &` (redirects both stdout and stderr to `my_output.log`).


## find process

```bash
pgrep jupyter

ps -ef| grep jupyter
```
