---
---

# Seldon v2
## Installation

```bash
# First of all, clone the repository and set the branch to v2.

git clone --single-branch --branch v2 https://github.com/SeldonIO/seldon-core.git

# After that, you should be aware that enable dns and storage on microk8s. This is because the different namespaces know each other(takes me 1 day)

microk8s enable dns storage

# After that install kafka with strimzi
# https://github.com/SeldonIO/seldon-core.git


kubectl get crds | grep kafka

kubectl create namespace kafka


kubectl apply -f https://strimzi.io/install/latest?namespace=kafka -n kafka


kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-ephemeral.yaml -n kafka


kubectl get pods -n kafka

# And it should be like this:


   NAME                                          READY   STATUS    RESTARTS      AGE
my-cluster-entity-operator-7dfb85ccf9-28dqd   3/3     Running   0             95s
my-cluster-kafka-0                            1/1     Running   0             118s
my-cluster-kafka-1                            1/1     Running   0             118s
my-cluster-kafka-2                            1/1     Running   0             118s
my-cluster-zookeeper-0                        1/1     Running   0             2m21s
my-cluster-zookeeper-1                        1/1     Running   0             2m21s
my-cluster-zookeeper-2                        1/1     Running   0             2m21s
strimzi-cluster-operator-f696c85f7-9fggx      1/1     Running   0             7m49s


# After that, you need to install seldon v2:

cd seldon-core

helm install seldon-core-v2-crds  k8s/helm-charts/seldon-core-v2-crds




kubectl create namespace seldon-mesh




helm install seldon-core-v2  k8s/helm-charts/seldon-core-v2-setup --namespace seldon-mesh




helm install seldon-v2-servers k8s/helm-charts/seldon-core-v2-servers --namespace seldon-mesh


kubectl get pods -n seldon-mesh
# It tooks some times to create pods in namespace seldon-mesh.
#If every things are ok, you sould see this:


NAME                                         READY   STATUS             RESTARTS       AGE
seldon-envoy-64c868fbf4-phmf6                1/1     Running            0              146m
seldon-modelgateway-674cffc4f6-vfvq4         1/1     Running            0              146m
seldon-hodometer-788948b44c-qjl77            1/1     Running            0              146m
seldon-pipelinegateway-5fd4cbdcdc-2s6rn      1/1     Running            0              146m
seldon-scheduler-0                           1/1     Running            0              146m
seldon-controller-manager-756dfcf8fc-hn5vz   1/1     Running            3 (146m ago)   146m
mlserver-0                                   3/3     Running            0              145m
triton-0                                     3/3     Running            0              145m

```
