---
title: kubectl logs
---

```bash
# get the full logs of the contrianers in inside the pod
kubectl logs -f pod/yolo-yolo-0-yolo-585b5469c7-9jsnr --all-containers

# watch on logs (important when the log changes)
watch kubectl logs pod/yolo-yolo-0-yolo-78fbc5fbdb-s45jw  --all-containers

# get logs of a special container
kubectl logs pod/yolo-yolo-0-yolo-69d5c75957-59ttj -c classifier-model-initializer
```
