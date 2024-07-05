---
title: streamline the building images workflow
---

[Docs](https://docs.docker.com/build/bake/reference/)


## random example

```hcl
# docker-bake.hcl
group "my-app" {
  targets = ["common", "api", "worker"]

  common = {
    context = "."
    dockerfile = "common.Dockerfile"
  }

  api = {
    inherits = ["common"]
    args = {
      SERVICE_NAME = "api"
    }
  }

  worker = {
    inherits = ["common"]
    args = {
      SERVICE_NAME = "worker"
    }
  }
}

```
