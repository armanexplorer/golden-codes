---
title: s3cmd
description: s3cmd commands
---

[Docs](https://bobcares.com/blog/how-to-configure-s3cmd/)
[Repo](https://github.com/s3tools/s3cmd)
[Parspack Manual](https://parspack.com/blog/hosting/connect-cloud-storage-s3cmd)

```bash
# install
apt-get update && apt-get install s3cmd

# configure
s3cmd --configure

# ---
# host_base: will be used to list the buckets (access the root of buckets)
# host_bucket: will be used as a DNS-style template to access a bucket
# ---

# list of buckets
s3cmd ls …

# list the contents of a bucket
s3cmd ls my-bucket-name

# upload
s3cmd put gitlab-secrets.json s3://c346364/

# download
s3cmd get s3://c346364/gitlab-secrets.json

# delete
s3cmd del s3://c346364/gitlab-secrets.json
```
