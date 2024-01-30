---
title: what options we have fro imagePullPolicy
---


The `imagePullPolicy` in Kubernetes determines when the kubelet should attempt to pull the specified image. There are three options for this policy:

1. `Always`: Kubernetes always pulls the image from the repository, even if a cached version of the image exists on the node.
2. `IfNotPresent`: Kubernetes only pulls the image if it does not already exist on the node.
3. `Never`: Kubernetes never pulls the image, even if it does not exist on the node.

If the `imagePullPolicy` specification is not defined in a manifest file, Kubernetes will set the policy depending on the image's tag. If the image is tagged `latest`, then Kubernetes will assume the `imagePullPolicy` to be `Always`. An image with no tag is assumed to be `latest`, and so its policy is set to `Always`. Otherwise, the orchestrator will default the `imagePullPolicy` to `IfNotPresent`.