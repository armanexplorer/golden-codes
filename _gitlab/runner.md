---
---

# really good description about runner and worker concepts
[ref](https://stackoverflow.com/questions/54534387/how-gitlab-runner-concurrency-works)

# install GitLab Runner as a conatiner
```bash
docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

```

## Register runner through the gitlab webstie (Recommended)
```bash
docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register  --url https://example.com  --token glrt-EDx1YqkeQhZDjs2YBxBL
```

# Register runner posibbly more interactivey
```bash
docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register
```

# OTHER THAN DIND SOLUTION (Because exposes the host docker!)
```bash
docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register --docker-image "docker:20.10.16" --docker-volumes /var/run/docker.sock:/var/run/docker.sock
```

# config
[main ref](https://docs.gitlab.com/runner/configuration/advanced-configuration.html)

[autoscale](https://docs.gitlab.com/runner/configuration/autoscale.html)

[ref](https://archives.docs.gitlab.com/16.3/ee/ci/runners/configure_runners.html)