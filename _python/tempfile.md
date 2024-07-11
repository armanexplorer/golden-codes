---
title: create temp dir in python
---

```py
import tempfile
import os

# Create a temporary directory
temp_dir = tempfile.mkdtemp()
# or
temp_dir = tempfile.mkdtemp(prefix="myapp_", suffix="_temp", dir="/path/to/desired/location")

print(f"Temporary directory created: {temp_dir}")

# Use the temporary directory
# ...

# Optional: Remove the temporary directory when done
# os.rmdir(temp_dir)
```

Or if you want auto clear of temp dir:

```py
with tempfile.TemporaryDirectory() as temp_dir:
    print(f"Created temporary directory: {temp_dir}")
    # Use the directory
# The directory and its contents are removed at the end of the block
```
