---
title: Seldon V2 HuggingFace Models
desription: bring up a HuggingFace Pipeline
---

```bash
Error:
AttributeError: module 'lib' has no attribute 'X509_V_FLAG_CB_ISSUER_CHECK'

Solution:
sudo apt remove python3-pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py

pip install pyopenssl --upgrade


# bring up hugging face pipelines

cd seldon-core/samples/examples/huggingface

# make install-requirements and make install-ffmpeg-ubuntu
make

pip install jupyter
pip install notebook==6.1.5
pip install -U ipywidgets==7.7.1
```

ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
seldon-core 1.17.0 requires jsonschema<4.0.0, but you have jsonschema 4.19.0 which is incompatible.

```bash
make install-requirements

export SELDON_INFER_HOST=$(kubectl get svc seldon-mesh -n seldon-mesh -o jsonpath='{.status.loadBalancer.ingress[0].ip}'):80
export SELDON_SCHEDULE_HOST=$(kubectl get svc seldon-scheduler -n seldon-mesh -o jsonpath='{.status.loadBalancer.ingress[0].ip}'):9004
export SELDON_KAFKA_BROKER=seldon-kafka-bootstrap.kafka:9092


seldon model load -f ../../models/hf-whisper.yaml
seldon model load -f ../../models/hf-sentiment.yaml

seldon model status whisper -w ModelAvailable | jq -M .
seldon model status sentiment -w ModelAvailable | jq -M .

seldon model load -f ../../models/hf-sentiment-input-transform.yaml
seldon model load -f ../../models/hf-sentiment-output-transform.yaml

seldon model status sentiment-input-transform -w ModelAvailable | jq -M .
seldon model status sentiment-output-transform -w ModelAvailable | jq -M .

seldon pipeline load -f ../../pipelines/sentiment-explain.yaml

seldon pipeline status sentiment-explain -w PipelineReady| jq -M .

```

```bash
# install opentelemetry

# install cert-manager first
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.12.3/cert-manager.yaml

# install opentelemetry operator
kubectl apply -f https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml

# create a collector (connect to promethued in k8s)
cat opentelemetry-collector.yaml

apiVersion: opentelemetry.io/v1alpha1
kind: OpenTelemetryCollector
metadata:
  name: seldon
  namespace: seldon-mesh
spec:
  config: |
    receivers:
      prometheus:
        config:
          scrape_configs:
          - job_name: 'my-job'
            scrape_interval: 10s
            static_configs:
            - targets: ['localhost:9090']
    exporters:
      logging:
    service:
      pipelines:
        metrics:
          receivers: [prometheus]
          exporters: [logging]


```
