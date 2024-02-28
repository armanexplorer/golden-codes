---
title: mc to access s3 buckets
---

[Docs](https://min.io/docs/minio/linux/reference/minio-mc.html)
[Repo](https://github.com/minio/mc)
[Parspack Manual](https://parspack.com/blog/hosting/cloud-computing-tutorial/minio-client)

## install

```bash
wget https://dl.min.io/client/mc/release/linux-amd64/mc

chmod +x mc

mv mc /usr/bin

mc
```

## commands

```bash
# set our provider
mc alias set parspack https://s3.example.com ACCESS_KEY SECRET_KEY --api S3v4

# list providers (verify)
mc alias ls

# cp from bucket to local
mc cp irs3/c828093/test/test.txt .

# cerate new bucket
# [Docs](https://min.io/docs/minio/linux/reference/minio-mc/mc-mb.html)
mc mb minio/hgface
```
