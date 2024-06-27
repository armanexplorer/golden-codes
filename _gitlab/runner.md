---
title: all about working with runners in gitlab ci
---

## really good description about runner and worker concepts

[ref](https://stackoverflow.com/questions/54534387/how-gitlab-runner-concurrency-works)

## install GitLab Runner as a conatiner

```bash
docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

```

## Register runner through the gitlab webstie (Recommended)

```bash
docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register  --url https://example.com  --token glrt-AuFGxtvgCV9ydFca9jQu
```

## Register runner posibbly more interactivey

```bash
docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register
```

## OTHER THAN DIND SOLUTION (Because exposes the host docker!)

```bash
docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register --docker-image "docker:20.10.16" --docker-volumes /var/run/docker.sock:/var/run/docker.sock
```

## config

[main ref](https://docs.gitlab.com/runner/configuration/advanced-configuration.html)

[autoscale](https://docs.gitlab.com/runner/configuration/autoscale.html)

[ref](https://docs.gitlab.com/ee/ci/runners/configure_runners.html)

## docker image tags

[Docker Hub Link](https://hub.docker.com/r/gitlab/gitlab-runner/tags)

## configure registry

### Standard authentication methods

```bash
[[runners]]
  environment = ["DOCKER_AUTH_CONFIG={\"auths\":{\"registry.example.com:5000\":{\"auth\":\"bXlfdXNlcm5hbWU6bXlfcGFzc3dvcmQ=\"}}}"]

```

### Docker-in-Docker Mode

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
