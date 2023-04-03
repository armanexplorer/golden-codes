---
title: monitor processes inside a container
description: How to find the process ID of a container and monitor the processes inside the container
---

# find the container process ID
```bash
docker inspect --format '{{.State.Pid}}' <container-name-or-id>
```

# monitor the processes inside the container
```bash
sudo htop -p [PID]
```
