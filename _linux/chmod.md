---
title: how to work with chmod in linux
---

You should use four digits for the `chmod` command when you want to set not only the basic read, write, and execute permissions for the owner, group, and others, but also special flags that **modify how the file or directory behaves**. These special flags are controlled by the **first digit** in the four-digit permission code.

Here's a breakdown of what each digit in a four-digit `chmod` code means:

**Digit 1 (Special Flags):**

- **0 (default):** No special flags are set.
- **4:** Sets the **setuid** bit. When a file with the setuid bit is executed, it runs with the permissions of the file's owner, regardless of who actually executed it. (Use with caution!)
- **2:** Sets the **setgid** bit. Similar to setuid, but the file runs with the permissions of the file's group.
- **1:** Sets the **sticky bit** (applies to directories only). This affects how files within the directory can be deleted. Only the owner of the directory, the owner of the file, or the root user can delete files with the sticky bit set.

**Digits 2, 3, and 4 (Basic Permissions):**

- These digits follow the same logic as a three-digit permission code. Each digit (ranging from 0 to 7 in octal) controls the permissions for a specific user class:
    - **Digit 2:** Permissions for the owner (user who owns the file)
    - **Digit 3:** Permissions for the group (group the file belongs to)
    - **Digit 4:** Permissions for others (everyone else on the system)

Each digit itself is a combination of three binary values (1 for granted permission, 0 for denied):

- **Rightmost bit (1):** Execute permission
- **Middle bit (2):** Write permission
- **Leftmost bit (4):** Read permission

So, for example, a permission code of `644` would translate to:

- **Owner (6):** Read and write (4 + 2)
- **Group (4):** Read only (4)
- **Others (4):** Read only (4)

**Combining Special Flags and Basic Permissions:**

To set both special flags and basic permissions, you add the values for each digit. For instance, `4644` would mean:

- **Setuid bit (4) is set**
- **Owner (6):** Read and write (4 + 2)
- **Group (4):** Read only (4)
- **Others (4):** Read only (4)

**Important Points:**

- Leading zeros in the four-digit code can be omitted (e.g., `0644` is the same as `644`).
- Use special flags with caution, as they can impact security if not managed properly.
