---
---

# find container name from docker0 ip

```bash
# xargs -n 1 => one arg at a time
# cut -c2- => extract from second character to end of string
sudo docker ps -q | xargs -n 1 docker inspect --format '{{ .Name }} {{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}}' | grep 172.17.0.2 | awk '{print $1}' | cut -c2-
```

## find the containers based on volumes being used in them

```bash
docker ps -a --filter volume=<volume_name>
```
