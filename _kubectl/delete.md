---
---

```bash
# delete all common types of resources from a namespace
kubectl delete all --all -n $namespace

# delete all common types of resources from all of the namespaces
for namespace in $(kubectl get ns -o name | cut -d"/" -f2); do
  kubectl delete all --all -n "$namespace"
done

# get a resource in all namespaces
kubectl get pvc --all-namespaces

# delete all instances of a resource in a namespace
kubectl delete pvc --all -n minio-system

# delete all of the pvc that belong to minio
kubectl delete pvc -l app=minio -n minio-system
```