---
title: MinIO Client
---

# set alias
```bash
mc alias set minio http://localhost:31900 "$ACCESS_KEY" "$SECRET_KEY" --api s3v4
```

# see the alias storages
```bash
mc alias list
```
# see the buckets in minio
```bash
mc ls minio
```
