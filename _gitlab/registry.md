---
---

# Standard authentication methods
```bash
[[runners]]
  environment = ["DOCKER_AUTH_CONFIG={\"auths\":{\"registry.example.com:5000\":{\"auth\":\"bXlfdXNlcm5hbWU6bXlfcGFzc3dvcmQ=\"}}}"]

```


# Docker-in-Docker Mode
When you use Docker-in-Docker, the standard authentication methods do not work, because a fresh Docker daemon is started with the service.

```bash
cp ~/.docker/config.json /opt/.docker/

[[runners]]
  ...
  executor = "docker"
  [runners.docker]
    ...
    privileged = true
    volumes = ["/opt/.docker/config.json:/root/.docker/config.json:ro"]
```