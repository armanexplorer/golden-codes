---
title: Docker inspect commands
---

{% raw %}

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' project_token
```

{% endraw %}
