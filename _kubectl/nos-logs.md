---
title: how we should install nos to enable MPS?
---

## yolo

```bash
k logs -f pod/yolo-yolo-0-yolo-5d98b58dc6-l2846
```

## mps server

```bash
kubectl logs -f pod/nvidia-device-plugin-nebuly-xsf6k -n nebuly-nvidia -c nvidia-mps-server
```

## device plugin

```bash
kubectl logs -f pod/nvidia-device-plugin-nebuly-xsf6k -n nebuly-nvidia -c nvidia-device-plugin-ctr
```

## device plugin sidecar

```bash
kubectl logs -f pod/nvidia-device-plugin-nebuly-xsf6k -n nebuly-nvidia -c nvidia-device-plugin-sidecar 
```

## init container: set compute mode

```bash
kubectl logs -f pod/nvidia-device-plugin-nebuly-xsf6k -n nebuly-nvidia -c set-compute-mode
```

## init container: set mps volume permissions

```bash
kubectl logs -f pod/nvidia-device-plugin-nebuly-xsf6k -n nebuly-nvidia -c set-nvidia-mps-volume-permissions
```

## init container: device plugin init

```bash
kubectl logs -f pod/nvidia-device-plugin-nebuly-xsf6k -n nebuly-nvidia -c nvidia-device-plugin-init 
```
