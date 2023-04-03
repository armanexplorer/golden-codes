---
title: Seldon V2 Installation
desription: step by step guilde to install seldon v2
---

# Installing microk8s
```bash
sudo snap install microk8s --classic

# add microk8s group to the current user groups
sudo usermod -a -G microk8s $USER

# change the owner of the kubernetes configuration files to the current user
sudo chown -f -R $USER ~/.kube

# reload currnet user groups
newgrp microk8s

microk8s status --wait-ready

microk8s enable dashboard dns registry istio

# MAKE EXTERNAL IP POSSIBLE WHEN SOEM SERVICES REQUEST IT
microk8s enable metallb
# Enter each IP address range delimited by comma (e.g. '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 192.168.0.105-192.168.0.111

microk8s kubectl get all --all-namespaces

# make `kubectl` and `helm` commands available as microk8s aliases
cat << EOF >> ~/.bash_aliases

# Microk8s aliases
alias kubectl='microk8s kubectl'
alias helm='microk8s helm'
EOF
```

# Install Seldon V2
Follow the mentioned steps to completely bring up the Seldon V2

## Uninstall old Seldon V2
### Uninstall releases

```bash
helm uninstall seldon-v2-servers --namespace seldon-mesh

# added in seldon v2.6.0 (not included in v2.4.0)
helm uninstall seldon-v2-runtime --namespace seldon-mesh

helm uninstall seldon-core-v2  --namespace seldon-mesh

helm uninstall seldon-core-v2-crds --namespace default

# in new instllation
helm uninstall seldon-core-v2-components --namespace seldon-mesh
helm uninstall seldon-core-v2-servers --namespace seldon-mesh
```
### Uninstall all resources
```bash
kubectl delete all --all -n seldon-mesh --cascade
kubectl delete server --all -n seldon-mesh --cascade
```

### Remove remained resources (IT IS COMPLETELY POSSIBLE!)

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

```bash
kubectl delete namespace seldon-mesh
```

### DELETE namespace forcefully
```log
kubectl get namespace seldon-mesh -o json > tempfile.json

# change spec to be like this
# "spec" : {
#    }

kubectl replace --raw "/api/v1/namespaces/seldon-mesh/finalize" -f ./tempfile.json
```

## Installing Kafka (via Strimzi)
Follow the below steps

### install `kafka` namespace
```bash
kubectl create ns kafka || echo "Namespace kafka already exists"
```

### install last kafka-operator from repo
```bash
# install CRDS and the settling up the cluster
kubectl apply -f https://strimzi.io/install/latest?namespace=kafka -n kafka

# the old way of creating kafka cluster (the cluster name doesn't match seldon defaults)
# kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-ephemeral.yaml -n kafka
```

### install compatible kafka cluster with seldon
```bash
cat kafka.yaml
```
```yaml
apiVersion: kafka.strimzi.io/v1beta2
kind: Kafka
metadata:
  name: seldon
  namespace: kafka
spec:
  kafka:
    replicas: 3
    version: 3.3.1
    config:
      auto.create.topics.enable: true
      default.replication.factor: 1
      inter.broker.protocol.version: 3.3
      min.insync.replicas: 1
      offsets.topic.replication.factor: 1
      transaction.state.log.min.isr: 1
      transaction.state.log.replication.factor: 1
    listeners:
    - name: plain
      port: 9092
      tls: false
      type: internal
    storage:
      type: ephemeral
  zookeeper:
    replicas: 1
    storage:
      type: ephemeral
```
```bash
kubectl apply -f kafka2.yaml
```
The excpected output of `kubectl get pods -n kafka`:
```bash
seldon-kafka-2                              1/1     Running   1 (80s ago)   2m2s
seldon-kafka-1                              1/1     Running   1 (80s ago)   2m2s
seldon-kafka-0                              1/1     Running   1 (80s ago)   2m2s
seldon-zookeeper-0                          1/1     Running   0             2m2s
strimzi-cluster-operator-566948f58c-lthbs   1/1     Running   0             11h
```

## Install Seldon Core V2
[Reference Link](https://docs.seldon.io/projects/seldon-core/en/v2.6.0/contents/getting-started/kubernetes-installation/helm.html)
[deprecated Link](https://docs.seldon.io/projects/seldon-core/en/v2.4.0/contents/getting-started/kubernetes-installation/helm.html)

```bash
microk8s enable dns storage observability 

# to dedicate external ip to the `seldon-scheduler` and `seldon-mesh`
microk8s enable metallb
# Enter each IP address range delimited by comma (e.g. '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 192.168.0.105-192.168.0.111

helm repo add seldon-charts https://seldonio.github.io/helm-charts
helm repo update seldon-charts

# Install CRDs with cloned version
git clone --single-branch --branch v2 https://github.com/SeldonIO/seldon-core.git
cd seldon-core
helm install seldon-core-v2-crds  k8s/helm-charts/seldon-core-v2-crds
cd ..

# DID NOT WORK LAST TIME!
# helm install seldon-core-v2-crds  seldon-charts/seldon-core-v2-crds

kubectl create namespace seldon-mesh

cat components-values.yaml
```
```yaml
dataflow:
  resources:
    cpu: 500m

envoy:
  service:
    type: ClusterIP

kafka:
  bootstrap: "seldon-kafka-bootstrap.kafka:9092"
  topics:
    numPartitions: 4

opentelemetry:
  disable: true
  enable: false

scheduler:
  service:
    type: ClusterIP

serverConfig:
  mlserver:
    resources:
      cpu: 1
      memory: 2Gi

  triton:
    resources:
      cpu: 1
      memory: 2Gi

serviceGRPCPrefix: "http2-"
```

use custom helm values (`components-values.yaml`) for installing seldon-core-v2 according to the kafka installation we did before, which we will need for our pipelines

```bash
# install in one command (Recommended)
helm install seldon-core-v2 seldon-charts/seldon-core-v2-setup --namespace seldon-mesh --values components-values.yaml --set controller.clusterwide=true

# OR install in two commands
helm install seldon-core-v2 seldon-charts/seldon-core-v2-setup --namespace seldon-mesh
helm upgrade seldon-core-v2 seldon-charts/seldon-core-v2-setup --values components-values.yaml -n seldon-mesh

# added in seldon v2.6.0 (not included in v2.4.0)
helm install seldon-v2-runtime seldon-charts/seldon-core-v2-runtime --namespace seldon-mesh --set config.tracingConfig.disable=true

helm install seldon-v2-servers seldon-charts/seldon-core-v2-servers --namespace seldon-mesh

# match the pods with the expected ones
kubectl get pods -n seldon-mesh

NAME                                         READY   STATUS    RESTARTS   AGE
seldon-controller-manager-58cb6cdf86-s5b9r   1/1     Running   0          9m50s
seldon-pipelinegateway-86458ff8b5-7mdgv      1/1     Running   0          9m38s
seldon-modelgateway-7d8d78dbbf-kzsnq         1/1     Running   0          9m38s
hodometer-6946f6d879-9zs8j                   1/1     Running   0          9m38s
seldon-envoy-7957bfcd6d-lcf69                1/1     Running   0          9m38s
seldon-scheduler-0                           1/1     Running   0          9m38s
triton-0                                     3/3     Running   0          9m8s
seldon-dataflow-engine-5974f7dcf9-zl68w      1/1     Running   0          55s
mlserver-0                                   3/3     Running   0          52s
```

### new install method
[Production Installation](https://deploy.seldon.io/en/v2.1/contents/getting-started/production-installation/core-v2.html)

```bash
helm upgrade seldon-core-v2-components seldon-charts/seldon-core-v2-setup \
    --version 2.5.0 \
    -f components-values.yaml \
    --namespace seldon-mesh \
    --install

helm upgrade seldon-core-v2-servers seldon-charts/seldon-core-v2-servers \
    --version 2.6.0 \
    -f servers-values.yaml \
    --namespace seldon-mesh \
    --install
```

## Troubleshoot
If You are getting errors like the following:

```log
ERROR   Reconciler error        {"controller": "server", "controllerGroup": "mlops.seldon.io", "controllerKind": "Server", "server": {"name":"triton","namespace":"seldon-mesh"}, "namespace": "seldon-mesh", "name": "triton", "reconcileID": "d124e7a7-c62d-4abc-82bc-3593c1b57c88", "error": "rpc error: code = Unavailable desc = connection error: desc = \"transport: Error while dialing dial tcp: lookup seldon-scheduler.seldon-mesh on 10.152.183.10:53: no such host\""}
```
### Solution: uninstall the seldon completey (untill deleting namespace) and install the last version which tagged by SemVer

### Solution2: If the problem has not been resolved, try to enable `ingress` with `microk8s enable ingress` and then completely uninstall the seldon and its namespace and install it again.
