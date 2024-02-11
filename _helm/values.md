---
---


# get chart default values
helm show values minio/minio

# get the user-defined relase values 
helm get values minio -n minio-system

# get the all relase values 
helm get values minio -n minio-system --all


# get all things about this release as a yaml file (not just values)
helm get all minio -n minio-system