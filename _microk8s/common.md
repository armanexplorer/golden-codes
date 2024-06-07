---
title: Comman MikroK8S commands
desription: Command commands which we need to use in MicroK8S
---
```bash
/snap/microk8s/5219/bin/helm --kubeconfig=/var/snap/microk8s/5219/credentials/client.config upgrade --install kube-prom-stack -f /var/snap/microk8s/common/addons/core/addons/observability/grafana.yaml -f  --set kubeControllerManager.endpoints={172.25.99.105} --set kubeProxy.endpoints={172.25.99.105} --set kubeScheduler.endpoints={172.25.99.105} --version 45.5.0 prometheus-community/kube-prometheus-stack -n observability


nano /var/snap/microk8s/common/addons/core/addons/observability/enable

kubectl -n observability get events --sort-by='{.lastTimestamp}'

kubectl -n kube-system logs <container_name>

# Observability has been enabled (user/pass: admin/prom-operator)


microk8s kubectl get all -n kube-system | grep prometheus

microk8s helm history prometheus-operator --namespace prometheus

microk8s helm list -a -n observability

helm rollback <release> <revision> --namespace <namespace>

microk8s helm rollback kube-prom-stack 1 --namespace observability

kubectl -n kube-system edit service kubernetes-dashboard

kubectl describe pod [podname] -n kube-system

$HOME/.config/helm


/var/snap/microk8s/5219/credentials/client.config
```


# remove all pods completely in a namespace when we are using microk8s
```bash
kubectl delete pod --all -n <namespace> # delete pods
kubectl delete all --all -n <namespace> --cascade #  delete everything
kubectl delete crd $(kubectl get crd | grep seldon | awk '{print $1}')
```

# remove remained resources (IT IS COMPLETELY POSSIBLE!)
```bash
# remove mlserver
kubectl get server mlserver -n seldon-mesh -o json > tempfile.json
# remove the line which defines the `finalizer`:
"finalizers": [
    "seldon.server.finalizer"
],
kubectl replace --raw "/apis/mlops.seldon.io/v1alpha1/namespaces/seldon-mesh/servers/mlserver" -f tempfile.json

# remove triton
kubectl get server triton -n seldon-mesh -o json > tempfile.json
# remove the line which defines the `finalizer`:
kubectl replace --raw "/apis/mlops.seldon.io/v1alpha1/namespaces/seldon-mesh/servers/triton" -f tempfile.json
```

# delete namespace
```bash
kubectl delete namespace seldon-mesh
kubectl delete namespace seldon-mesh  --grace-period=0 --force
```

# Remove namespace when stocked
```bash

kubectl get namespace seldon-mesh -o json > tempfile.json

# change spec to be like this
# "spec" : {
#    }

kubectl replace --raw "/api/v1/namespaces/seldon-mesh/finalize" -f ./tempfile.json
```

# Error: INSTALLATION FAILED: cannot re-use a name that is still in use (Remove release)
```bash
# keep history
helm delete seldon-v2-servers -n seldon-mesh

# remove release completely
helm uninstall seldon-v2-servers -n seldon-mesh
```

# Random commands
```bash
kubectl get namespaces seldon-mesh -o jsonpath='{.metadata.deletionTimestamp}'

```

# edit kafka.bootstrap to my-cluster-kafka-bootstrap.kafka:9092
```bash
helm upgrade seldon-core-v2 seldon-charts/seldon-core-v2-setup -n seldon-mesh -f seldon-values.yaml
```

# edit a service
```bash
kubectl edit service seldon-scheduler -n seldon-mesh
```

# list installed releases
```bash
helm list --all-namespaces
```

# seldon-cli installation


```bash
# edit the flags file to put the kuber hosts
nano ./cmd/seldon/cli/flags.go

# you should put something like this according to you services
50         defaultInferHost     = "10.1.183.92:9001"
51         defaultKafkaHost     = "10.152.183.119:9092"
52         defaultSchedulerHost = "10.152.183.32:9004"

go build -o bin/seldon -v ./cmd/seldon
```

# Helm Release

## List
```bash
helm list -n seldon-mesh
```

## Values
```bash
# User
helm get values seldon-core-v2 -n seldon-mesh

# All
helm get values --all seldon-core-v2 -n seldon-mesh
helm get values --all seldon-v2-runtime -n seldon-mesh


helm show values seldon-charts/seldon-core-v2-setup -n seldon-mesh > seldon-values.yaml
```

# ConfigMap
```bash
kubectl get configmap -n seldon-mesh
kubectl get configmap seldon-tracing -o yaml -n seldon-mesh
kubectl delete configmap seldon-tracing -n seldon-mesh
```

# SeldonConfig
```bash
kubectl get seldonconfig -n seldon-mesh
kubectl get seldonconfig default -o yaml -n seldon-mesh
```

# Seldon CLI
```bash
seldon server list
seldon model list
# watch the 17 Agust 2023 community call on zoom (sent to announcements of seldon community on Slack)
```

# Namespaces
```bash
# change default namepsace to seldon-mesh
kubectl config set-context --current --namespace=seldon-mesh
```

# Logging
```bash
kubectl logs `kubectl get pods | awk '/otel-collector/ {print $1}'`
```

```bash
seldon model unload -f models/tfsimple1.yaml
seldon model unload -f models/tfsimple2.yaml
seldon pipeline unload -f pipelines/tfsimples.yaml

seldon model unload -f models/mul10.yaml
seldon model unload -f models/add10.yaml
seldon pipeline unload -f pipelines/trigger-joins.yaml


config.tracingConfig.disable=true

helm upgrade seldon-core-v2 seldon-charts/seldon-core-v2-setup -n seldon-mesh --set opentelemetry.disable=true

helm upgrade seldon-core-v2 seldon-charts/seldon-core-v2-setup -n seldon-mesh --set kafka.bootstrap=seldon-kafka-bootstrap.kafka:9092

helm upgrade seldon-v2-runtime seldon-charts/seldon-core-v2-runtime -n seldon-mesh --set config.tracingConfig.disable=true


seldon model load -f ./models/hf-whisper.yaml
seldon model load -f ./models/hf-sentiment.yaml


http://192.168.0.106/v2/models/tfsimples/infer
```
