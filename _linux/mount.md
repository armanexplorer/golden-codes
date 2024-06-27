---
title: all about mount in linux
---

**1. Identify the Drive and Mount Point:**

* Open a terminal window.
* Use the `lsblk` command to list all block devices. Identify the device you want to mount permanently. This could be a secondary drive (`/dev/sdb1`), a partition (`/dev/sda3`), or a USB drive (`/dev/sdX`). Note the device name.
* Decide on a mount point directory. This is where the contents of the drive will be accessible. It's recommended to create a dedicated directory under `/media` (e.g., `/media/mydrive`). If the directory doesn't exist, create it using `sudo mkdir /media/mydrive`.

**2. Find the Device's UUID (Optional but recommended):**

* Using the device name from step 1, find the Universally Unique Identifier (UUID) with the following command:

```bash
sudo blkid
```

* Look for the line corresponding to your device and note the UUID value. It will be a string of alphanumeric characters separated by hyphens (e.g., UUID=03ec5dd3-45c0-4f95-a363-61ff321a09ff).

**3. Edit the fstab File (carefully):**

* The `/etc/fstab` file defines mount points and options for devices. Editing this file requires administrative privileges. Use a text editor like nano with sudo:

```bash
sudo nano /etc/fstab
```

* **Back up the original fstab file (recommended):** Before making any changes, it's wise to create a backup. In the terminal, you can run:

```bash
sudo cp /etc/fstab /etc/fstab.bak
```

**4. Add a New Line for the Mount:**

* At the bottom of the fstab file, add a new line following this format:

```bash
<device> <mount_point> <filesystem_type> <options> <dump> <fsck>
```

Here's what each part means:

* `<device>`: Replace this with the device name (e.g., `/dev/sdb1`) or UUID (recommended for stability across reboots).
* `<mount_point>`: This is the directory you created in step 1 (e.g., `/media/mydrive`).
* `<filesystem_type>`: Specify the file system type of the drive (e.g., ext4 for common Linux drives). You can check the file system type with `blkid`.
* `<options>`: These are comma-separated options for mounting the drive (e.g., defaults). Common options include `defaults` (default options), `auto` (automount on boot), and `noauto` (don't automount on boot).
* `<dump>`: This value (usually 0 or 1) specifies if the drive should be included in system dump backups.
* `<fsck>`: This value (usually 0 or 1) determines the order in which the fsck (file system check) utility should check the drive.

**Example:**

```bash
UUID=03ec5dd3-45c0-4f95-a363-61ff321a09ff /media/mydrive ext4 defaults 0 2
```

**5. Save and Close the File:**

* In nano, press `Ctrl+O` to save the file and `Ctrl+X` to exit.

**6. Verify and Mount the Drive (Optional):**

* You can verify the syntax of your fstab entry with the following command:

```bash
sudo mount -a
```

* If there are no errors, the drive should be mounted. You can access its contents through the mount point directory.

**7. Reboot (Optional):**

* To ensure the mount persists across reboots, restart your system. The drive should be automatically mounted at boot time.

**Remember:** Editing the fstab file requires caution. Typos or errors can lead to boot failures. It's recommended to double-check your entries before saving. If you're unsure, consult the fstab man page with `man fstab` for detailed information on options and usage.

## dump and fsck

The `<dump>` and `<fsck>` options in the `/etc/fstab` file on Linux systems control how the system handles backups and filesystem checks for mounted partitions. Here's a detailed explanation of their individual meanings:

**<dump> (Field 5):**

* This field is related to the `dump(8)` utility, used for creating periodic backups of filesystems. However, `dump` is less commonly used in modern system administration due to the availability of more robust and flexible backup solutions.
* The `<dump>` value is typically set to either 0 or 1:
    * **0 (default):** The filesystem is not included in the automatic dump process managed by `dump(8)`.
    * **1:** The filesystem is included in the dump process.

**<fsck> (Field 6):**

* This field is crucial for ensuring the integrity of your filesystems. It determines the order in which the `fsck(8)` utility checks filesystems during the boot process to identify and fix potential inconsistencies.
* Common values for `<fsck>` are:
    * **0:** The filesystem is skipped by `fsck` during boot checks.
    * **1:** This value is typically used for the root filesystem (`/`). It signifies the highest priority, ensuring `fsck` checks the root partition first to guarantee a bootable system.
    * **2:** This is a common value for other partitions. It indicates the filesystem should be checked after the root partition (priority).

**Example:**

A typical `/etc/fstab` entry for a data partition might look like this:

```bash
UUID=03ec5dd3-45c0-4f95-a363-61ff321a09ff /media/mydrive ext4 defaults 0 2
```

In this example:

* `<dump>` is set to 0, indicating the partition is not included in automatic dumps.
* `<fsck>` is set to 2, meaning it will be checked after the root partition during boot.

**Important Points:**

* While `dump` might not be heavily used in modern systems, it's still good practice to understand the option.
* Setting the correct `<fsck>` values is essential for maintaining filesystem health. The root partition should always have the highest priority for checks.
* Refer to the `man fstab` command for more detailed information on these options and other functionalities within the `/etc/fstab` file.
