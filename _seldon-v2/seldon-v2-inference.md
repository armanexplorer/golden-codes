---
title: Seldon V2 Inference
desription: step by step guilde to make seldon inference a pipeline example
---

# With Seldon CLI
[Seldon CLI Docs](https://docs.seldon.io/projects/seldon-core/en/v2.6.0/contents/cli/index.html)

## Clone CLI
```bash
git clone https://github.com/SeldonIO/seldon-core --branch=v2
cd seldon-core/operator
```

## Build Seldon CLI
```bash
go build -o bin/seldon -v ./cmd/seldon
```

## Add Seldon CLI to the PATH
```bash
echo "export PATH=$PATH:/path/to/seldon-core/operator/bin" >> ~/.profile
source ~/.profile
```

## Expose services (`seldon-mesh` and `seldon-scheduler`) by `metallb` to assign them external IP
```bash
microk8s enable metallb
# Enter each IP address range delimited by comma (e.g. '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 192.168.0.105-192.168.0.111
```

## Set the Seldon CLI required environemnts
Every time you want to do infernce, you should run the following code:
```bash
export SELDON_INFER_HOST=$(kubectl get svc seldon-mesh -n seldon-mesh -o jsonpath='{.status.loadBalancer.ingress[0].ip}'):80
export SELDON_SCHEDULE_HOST=$(kubectl get svc seldon-scheduler -n seldon-mesh -o jsonpath='{.status.loadBalancer.ingress[0].ip}'):9004
export SELDON_KAFKA_BROKER=seldon-kafka-bootstrap.kafka:9092
```

# Use Seldon CLI to load models and pipelines (Exmaple 1)
```bash
seldon model load -f ./models/tfsimple1.yaml
seldon model load -f ./models/tfsimple2.yaml

seldon model status tfsimple1 -w ModelAvailable | jq -M .
seldon model status tfsimple2 -w ModelAvailable | jq -M .

seldon pipeline load -f ./pipelines/tfsimples.yaml
seldon pipeline status tfsimples -w PipelineReady| jq -M .

seldon pipeline infer tfsimples \
    '{"inputs":[{"name":"INPUT0","data":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],"datatype":"INT32","shape":[1,16]},{"name":"INPUT1","data":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],"datatype":"INT32","shape":[1,16]}]}' | jq -M .
```

# Example 2
```bash
seldon model load -f ./models/mul10.yaml
seldon model load -f ./models/add10.yaml

seldon model status mul10 -w ModelAvailable | jq -M .
seldon model status add10 -w ModelAvailable | jq -M .

seldon pipeline load -f ./pipelines/trigger-joins.yaml
seldon pipeline status trigger-joins -w PipelineReady | jq -M .
```

# Expose inference service (`seldon-mesh`) to the outside
[Refernce (v2.1)](https://deploy.seldon.io/en/v2.1/contents/getting-started/production-installation/core-v2.html)

We can expoes the Inference API with two ways:
## Nginx Ingress
```bash
cat seldon-mesh-ingress.yaml
```
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: seldon-mesh
  namespace: seldon
  annotations:
    nginx.ingress.kubernetes.io/backend-protocol: GRPC
spec:
  tls:
  rules:
  - host: seldon.inference.seldon
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: seldon-mesh
            port:
              number: 80
  - host: seldon.admin.seldon
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: seldon-scheduler
            port:
              number: 9004
  ingressClassName: nginx
```
## Istio
```bash
cat seldon-mesh-vs.yaml
```
```yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: seldon-mesh
  namespace: seldon
spec:
  gateways:
    - istio-system/seldon-gateway
  hosts:
    - "*"
  http:
    - name: "data-plane-seldon"
      match:
        - authority:
            exact: "seldon.inference.seldon"
      route:
        - destination:
            host: "seldon-mesh.seldon.svc.cluster.local"
            port:
              number: 80
    - name: "control-plane-seldon"
      match:
        - authority:
            exact: "seldon.admin.seldon"
      route:
        - destination:
            host: "seldon-scheduler.seldon.svc.cluster.local"
            port:
              number: 9004
```
