---
title: show the progress of moving files
---

## Running rclone move with Progress

To display progress while using the `rclone move` command, use the `--progress` flag. This will provide real-time updates on the transfer process.

**Basic Usage:**

```bash
rclone move source_path remote:destination_path --progress
```

**Breakdown:**

* `rclone move`: This command initiates the move operation.
* `source_path`: Specifies the local or remote source directory.
* `remote:destination_path`: Indicates the remote destination path.
* `--progress`: Enables the progress bar display.

**Example:**

```bash
rclone move /path/to/local/files mydrive:/backup --progress
```

**Additional Options:**

You can combine the `--progress` flag with other useful options:

* `--verbose (-v)`: Provides more detailed output, including file names and transfer speeds.
* `--delete-empty-src-dirs`: Deletes empty source directories after the move.
* `--transfers`: Limits the number of concurrent transfers.
* `--max-transfer`: Sets a maximum transfer size.

**Example with additional options:**

```bash
rclone move /path/to/local/files mydrive:/backup --progress -v --delete-empty-src-dirs --transfers 4 --max-transfer 100M
```

**Tips:**

* For larger transfers, consider using `--transfers` to optimize performance based on your system resources.
* The `--max-transfer` option can be helpful for managing network bandwidth.
* If you need more detailed logging, consider using the `--log-file` flag to save the output to a file.
