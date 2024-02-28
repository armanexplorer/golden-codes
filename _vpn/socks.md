---
title: all about socks proxy
---

## systemd service

Create such fullowing systemd service file:

```conf
# /etc/systemd/system/proxy-socks.service

[Unit]
Description=SOCKS Proxy over SSH
After=network.target
StartLimitIntervalSec=600
StartLimitBurst=200


[Service]
Type=simple
User=<user>
Restart=always
RestartSec=2
ExecStart=ssh -D 8081 -i /home/<user>/.ssh/id_ed25519 -C -N -p 22 username@hostname -v -v


[Install]
WantedBy=multi-user.target
```

```bash
# start the service
sudo systemctl start proxy-socks.service

# check it works
sudo systemctl status proxy-socks.service

# check logs
sudo journalctl -xeu proxy-socks.service

# enable if everything is OK
sudo systemctl enable proxy-socks.service
```
