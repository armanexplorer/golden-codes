---
title: how we should install nos to enable MPS?
---

[Repo](https://github.com/nebuly-ai/nos)
[Nos pre-installation](https://github.com/nebuly-ai/nos/blob/main/docs/en/docs/prerequisites.md)

## enable GPU support

Before installing nos, you must enable GPU support in your Kubernetes cluster.

### using GPU operator

[Nvidia Docs](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/install-gpu-operator.html)
[Nvidia Docs](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/getting-started.html)
[Nvidia Repo](https://github.com/NVIDIA/gpu-operator)

installing only the NVIDIA GPU Operator, which automatically installs all the necessary components for you.

```bash
helm install --wait --generate-name \
     -n gpu-operator --create-namespace \
     nvidia/gpu-operator --version v22.9.0 \
     --set driver.enabled=true \
     --set migManager.enabled=false \
     --set mig.strategy=mixed \
     --set toolkit.enabled=true
```

### microk8s

```yaml (values.yaml)
migManager:
  enabled: false

mig:
  strategy: mixed

toolkit:
  enabled: true
```

```bash
microk8s disable gpu

kubectl delete crd clusterpolicies.nvidia.com || true

kubectl delete crd nvidiadrivers.nvidia.com || true

microk8s enable gpu --driver operator --version 22.9.0 --values values.yaml
```

### manual

manually install the required components individually

## install Nebuly's device plugin

[Nos deivce plugin Docs](https://github.com/nebuly-ai/k8s-device-plugin)
[Custom Values](https://github.com/nebuly-ai/k8s-device-plugin/blob/main/deployments/helm/nvidia-device-plugin/values.yaml)

### TURNING OFF THE POSSIBLE NVIDIA DEVICE PLUGIN

```bash
kubectl label node arman-gpu nvidia.com/gpu.deploy.device-plugin=false --overwrite
```

### Alternative solution to `TURNING OFF THE POSSIBLE NVIDIA DEVICE PLUGIN`

Apply this to the `gpu-operator` helm chart to disable nvidia device plugin for nebuly target nodes:

```yaml
nodeAffinity:
  requiredDuringSchedulingIgnoredDuringExecution:
    nodeSelectorTerms:
      - matchExpressions:
          - key: nos.nebuly.com/gpu-partitioning
            operator: NotIn
            values:
              - mps
migManager:
  enabled: false
mig:
  strategy: mixed
```

### enable automatic MPS partitioning on a node

[Docs](https://github.com/nebuly-ai/nos/blob/main/docs/en/docs/dynamic-gpu-partitioning/getting-started-mps.md)

```bash
kubectl label nodes arman-gpu "nos.nebuly.com/gpu-partitioning=mps"
```

### NOTE: ONLY run it if the plugin FAILED TO UP

```bash
kubectl label node arman-gpu nvidia.com/device-plugin.config- 
```

### install plugin

```bash
helm install oci://ghcr.io/nebuly-ai/helm-charts/nvidia-device-plugin \
  --version 0.13.0 \
  --generate-name \
  -n nebuly-nvidia \
  --create-namespace
```

## install nos

[Docs](https://github.com/nebuly-ai/nos/blob/main/docs/en/docs/installation.md)
[Configration Values](https://github.com/nebuly-ai/nos/blob/main/docs/en/docs/helm-charts/nos/README.md)
[Configration Values Description](https://github.com/nebuly-ai/nos/blob/main/docs/en/docs/dynamic-gpu-partitioning/configuration.md)

### install cert-manager

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.2/cert-manager.yaml
```

### install nos using helm

```bash
helm install oci://ghcr.io/nebuly-ai/helm-charts/nos \
  --version 0.1.2 \
  --namespace nebuly-nos \
  --generate-name \
  --create-namespace
```

### uninstall nos

```bash
helm uninstall nebuly-nos -n nebuly-nos
```

## create test pods

[Docs](https://github.com/nebuly-ai/nos/blob/main/docs/en/docs/dynamic-gpu-partitioning/getting-started-mps.md)

```bash
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: mps-partitioning-example
spec:
  hostIPC: true # (2)
  securityContext:
    runAsUser: 1000 # (3)
  containers:
    - name: sleepy
      image: "busybox:latest"
      command: ["sleep", "120"]
      resources:
        limits:
          nvidia.com/gpu-10gb: 1 # (1)
EOF
```

1. Fraction of GPU with 10 GB of memory
2. hostIPC must be set to true (allow containers to access the IPC namespace of the host)
3. Containers must run as the same user as the MPS Server (1000)

## logging

[Docs](https://github.com/nebuly-ai/nos/blob/main/docs/en/docs/dynamic-gpu-partitioning/troubleshooting.md)

```bash
kubectl logs -n nebuly-nos pod/nos-1707662485-gpu-partitioner-846f9dc94f-w7n7f -f

kubectl logs -n nebuly-nvidia -l app.kubernetes.io/name=nebuly-nvidia-device-plugin -f -c nvidia-device-plugin-ctr

kubectl logs -n nebuly-nvidia -l app.kubernetes.io/name=nebuly-nvidia-device-plugin -f -c nvidia-mps-server

spw
# or 
watch -n 1 kubectl get all
```

## troubleshooting

Here the possible ordinary erros are covered

### error in 'microk8s enable gpu' after running different operators (from nos repo or nvidia website)

```bash
kubectl delete crd nodefeaturerules.nfd.k8s-sigs.io
helm repo update (not needed possibly!)
```

### "Error: specified config arman-gpu-1707430327 does not exist"

You need to remove some label from your node (labels are corrupted):

```bash
kubectl label node arman-gpu nvidia.com/device-plugin.config-
```

Full Error Message:

```log
msg="Label change detected: nvidia.com/device-plugin.config=arman-gpu-1707430327"
time="2024-02-09T16:25:33Z" 
level=info msg="Error: specified config arman-gpu-1707430327 does not exist"
Error from server (BadRequest): container "nvidia-device-plugin-sidecar" in pod "nvidia-device-plugin-nebu
```

### check the values have been applied

You can ensure the helm custom values have been set correctly by:

```bash
helm get values gpu-operator -n gpu-operator-resources
```

it should be like this:

```yaml
driver:
  enabled: "true"
mig:
  strategy: mixed
migManager:
  enabled: false
operator:
  defaultRuntime: containerd
toolkit:
  enabled: true
  env:
  - name: CONTAINERD_CONFIG
    value: /var/snap/microk8s/current/args/containerd-template.toml
  - name: CONTAINERD_SOCKET
    value: /var/snap/microk8s/common/run/containerd.sock
  - name: CONTAINERD_SET_AS_DEFAULT
    value: "1"
```

Or check all of the values by:

```bash
helm get values gpu-operator  -n gpu-operator-resources --all
```

Or get ALL INFO about the release:

```bash
helm get all gpu-operator  -n gpu-operator-resources
```

Or only check the chart table values by:

```bash
helm show values nvidia/gpu-operator
```
