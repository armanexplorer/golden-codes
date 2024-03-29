---
title: how to dockerize
---

## two mailserver with two differnet IPs

- configure extra IP on the host
- use ip-based binds in `ports` section
- use static docker IPs to specify the internal docker network IP for each container
- add firewall rule to modify the source of the outgoing packets using SNAT rule
