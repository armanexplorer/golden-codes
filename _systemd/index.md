---
title: basics of systemd
---

## Systemd Unit

[Systemd Unit](https://www.freedesktop.org/software/systemd/man/systemd.unit.html)
service.service, socket.socket, device.device, mount.mount, automount.automount, swap.swap, target.target, path.path, timer.timer, slice.slice, scope.scope

### Service

[Systemd Service](https://www.freedesktop.org/software/systemd/man/systemd.service.html)
A unit configuration file whose name ends in ".service" encodes information about a process controlled and supervised by systemd.

This man page lists the configuration options specific to this unit type. See systemd.unit(5) for the common options of all unit configuration files. The common configuration items are configured in the generic [Unit] and [Install] sections. The service specific configuration options are configured in the [Service] section.
