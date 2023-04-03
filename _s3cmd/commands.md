---
title: s3cmd
description: s3cmd commands
---

```bash
# list of s3 buckets
s3cmd ls

# upload
s3cmd put gitlab-secrets.json s3://c346364/

# download
s3cmd get s3://c346364/gitlab-secrets.json

# delete
s3cmd del s3://c346364/gitlab-secrets.json
```