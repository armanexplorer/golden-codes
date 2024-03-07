---
title: install local dns
---

## bind

[BIND Install](https://www.linuxbabe.com/ubuntu/set-up-local-dns-resolver-ubuntu-20-04-bind9)

## resolved

re-configure it if it has been installed but not activated

```bash
sudo apt update
sudo apt install systemd-resolved
sudo systemctl start systemd-resolved
sudo systemctl enable systemd-resolved
```

### troubleshooting

[Ref1](https://unix.stackexchange.com/questions/328131/how-to-troubleshoot-dns-with-systemd-resolved)

```bash
sudo systemctl restart systemd-resolved
```

```bash
journalctl -u systemd-resolved -f
systemd-resolve --status
```

In order to get more information from resolved you need to do service edit of via:

```bash
sudo systemctl edit systemd-resolved

[Service]
Environment=SYSTEMD_LOG_LEVEL=debug

sudo systemctl restart systemd-resolved

# to revert this logging change
sudo systemctl revert systemd-resolved
sudo systemctl restart systemd-resolved

```

## unbound

...

## dnsmasq

...
