---
title: Final Seldon V2 Installation
desription: step by step guilde to install seldon v2
---

# install kafka
[Kafka Installation](https://docs.seldon.io/projects/seldon-core/en/v2/contents/kubernetes/kafka/index.html)
[Kafka Examples](https://github.com/strimzi/strimzi-kafka-operator/tree/main/examples/kafka)

```bash
helm upgrade --install strimzi-kafka-operator \
  strimzi/strimzi-kafka-operator \
  --namespace seldon-mesh --create-namespace \
  --set featureGates='+UseKRaft\,+UseStrimziPodSets'

helm upgrade seldon-core-v2-kafka kafka/strimzi -n seldon-mesh --install
```

# install seldon
```bash
# install crds
helm install seldon-core-v2-crds  seldon-charts/seldon-core-v2-crds

kubectl create namespace seldon-mesh || echo "namespace already existing"

sleep 1
kubectl wait --for condition=established --timeout=60s crd/servers.mlops.seldon.io
kubectl wait --for condition=established --timeout=60s crd/serverconfigs.mlops.seldon.io

# install the core manager (handles the key resources used by Seldon, including the `SeldonRuntime` and `Server` resources)
helm install seldon-core-v2 seldon-charts/seldon-core-v2-setup --namespace seldon-mesh

# install core components
helm install seldon-v2-runtime seldon-charts/seldon-core-v2-runtime --namespace seldon-mesh

# install servers
helm install seldon-v2-servers seldon-charts/seldon-core-v2-servers --namespace seldon-mesh
```

# Uninstall old seldon
```bash
# First, Remove any models, pipelines that are running.
...
helm uninstall seldon-v2-servers  --namespace seldon-mesh || true
helm uninstall seldon-v2-runtime  --namespace seldon-mesh || true
helm uninstall seldon-core-v2  --namespace seldon-mesh || true
helm uninstall seldon-core-v2-crds || true
kubectl delete all --all -n seldon-mesh
```