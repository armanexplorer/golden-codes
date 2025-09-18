---
title: Docker push commands
---

```bash
## docker push
sed -n "s/\(docker.*\):.*/\1:latest/p" docker-compose.yaml | sort | uniq | cut -d" " -f6 | xargs -I{} docker push {}

## docker push
sed -n "s/\(docker.*\):.*/\1:latest/p" docker-compose-django.yaml | sort | uniq | cut -d" " -f6 | xargs -I{} docker pull {}
```

## push all registry image to the registry

{% raw %}

```bash
docker images --format "{{.Repository}}:{{.Tag}}" | grep registry.example | xargs -I {} docker push {}
```

{% endraw %}
