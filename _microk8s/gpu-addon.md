---
title: ...
---


[Docs](https://microk8s.io/docs/addon-gpu)

## install

```bash
microk8s enable gpu
```

## configuration options

In the microk8s enable gpu command, the following command-line arguments may be set:

| ARGUMENT              | DEFAULT | DESCRIPTION                                                                                                      |
|-----------------------|---------|------------------------------------------------------------------------------------------------------------------|
| --driver $driver      | auto    | Supported values are auto (use host driver if found), host (force use the host driver), or operator (force use the operator driver). |
| --version $VERSION    | v1.10.1 | Version of the GPU operator to install.                                                                           |
| --toolkit-version $VERSION | ``  | If not empty, override the version of the nvidia-container-runtime that will be installed.                      |
| --set-as-default-runtime / --no-set-as-default-runtime | true | Set the default containerd runtime to nvidia.                                                                    |
| --set $key=$value     | ``      | Set additional configuration options to the GPU operator Helm chart. May be passed multiple times. For a list of options see [values.yaml](https://github.com/NVIDIA/gpu-operator/blob/master/deployments/gpu-operator/values.yaml). |
| --values $file        | ``      | Set additional configuration options to the GPU operator Helm chart using a file. May be passed multiple times. For a list of options see [values.yaml](https://github.com/NVIDIA/gpu-operator/blob/master/deployments/gpu-operator/values.yaml) |

## possible solution for add more custom values

```bash
cat <<EOF > values.yaml
devicePlugin:
  daemonset:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: nos.nebuly.com/gpu-partitioning
                operator: NotIn
                values:
                  - mps
EOF

microk8s enable gpu --values values.yaml
```

## test mnicrok8s config

```bash
microk8s enable gpu --driver operator --version 22.9.0 --values values.yaml 
```
