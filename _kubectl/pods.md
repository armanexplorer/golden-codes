---
title: detail of working with pods using Kubectl
---

```bash
# specific config
kubectl get pod <pod-name> -n <namespace> -o=jsonpath='{.spec.serviceAccountName}'
```

```bash
# full config
kubectl get pod <pod-name> -n <namespace> -o yaml
```
