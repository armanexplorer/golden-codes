---
---


# get chart default values
helm show values minio/minio

# get the user-defined relase values 
helm get values minio -n minio-system

# get the all relase values 
helm get values minio -n minio-system --all