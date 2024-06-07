---
title: images and registry
---

## registry

[Built-in Registry](https://microk8s.io/docs/registry-built-in)

## CTR cache

```bash
# list cached images by microk8s
microk8s ctr images ls
# or
microk8s.ctr images ls

# remove image from cache by its reference
microk8s ctr images rm my.registry.com/project:tag
```

[Local Registry (CTR cache)](https://microk8s.io/docs/registry-images)
