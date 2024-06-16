---
title: how to findout the pid of process on a port
---

To kill an application running on a specific port in Linux, you can use the `fuser` command or other tools like `lsof` and `kill`. Here are the steps:

### Method 1: Using `fuser` Command

1. **Identify the Process Using the Port**:

   ```bash
   fuser <port_number>/tcp
   ```

   Replace `<port_number>` with the actual port number. For example, to check port 8080:

   ```bash
   fuser 8080/tcp
   ```

   This command will print the PIDs of any processes that have the TCP port 8080 open.

2. **Kill the Process Using the Port**:

   ```bash
   fuser -k <port_number>/tcp
   ```

   Replace `<port_number>` with the actual port number. For example, to kill processes using TCP port 8080:

   ```bash
   fuser -k 8080/tcp
   ```

   The `-k` option will terminate (kill) any processes that have the TCP port 8080 open.

### Method 2: Using `lsof` Command

1. **Identify the Process Using the Port**:

   ```bash
   lsof -i :<port_number>
   ```

   Replace `<port_number>` with the actual port number. For example, to find the process running on port 8080:

   ```bash
   lsof -i :8080
   ```

   The output will display the process details along with the PID.

2. **Kill the Process Using the Port**:

   ```bash
   kill <PID>
   ```

   Replace `<PID>` with the actual process ID. For example, to stop the process with PID 12345:

   ```bash
   kill 12345
   ```

   This will send a termination signal to the process running on the specific port, causing it to stop.

### Additional Notes

- If the process does not stop after sending the termination signal, you can use `kill -9` to forcefully kill the process. However, this should only be used as a last resort, as it does not allow the process to perform any cleanup operations.
- Ensure you have the necessary permissions to stop a process. If you are not running the commands as a privileged user, you may need to use `sudo` before the commands to run them with elevated privileges
