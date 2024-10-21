---
title: all about using tar in linux
---

To use tar on a full path while only including the target directory and not the folders in the path, you can use the following approach:

```bash
tar -czf archive.tar.gz -C /path/to/parent/directory target_directory
```

Also you can use multiple `-C`, but they should be relative to each other or be full path:

```bash
tar -czf archive.tar.gz -C /path/to/dir1 files1 -C /path/to/dir2 files2

# or
tar -czf sites_backup.tar.gz -C /var/www/site1 . -C ../site2 .
```
