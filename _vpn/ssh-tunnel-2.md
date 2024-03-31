---
title: config udpgw and google 403
---

## udpgw

We can do this in many ways include:

### More common way

[Docs](https://arazgholami.medium.com/using-ssh-tunneling-as-vpn-with-clients-for-mac-linux-windows-and-ios-android-tv-6e80e98d1e16)

```bash
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw64"
chmod u+x /usr/bin/badvpn-udpgw

cat <<EOF > /etc/rc.local
#!/bin/sh -e
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7301
exit 0
EOF
chmod u+x /etc/rc.local

systemctl daemon-reload
systemctl start rc-local.service
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7301
```

- **-A**: This flag tells the screen command to adapt the windows to the size of the current terminal.
- **-m**: This flag forces screen to create a new window even if screen is already running.
- **-d**: This flag tells screen to start the session in detached mode, meaning it will run in the background without attaching to it immediately.
- **-S**: This flag allows you to specify a session name for the new screen session.

By using "screen -AmdS", you are essentially creating a new screen session that is detached, ensuring it runs independently in the background with the specified session name.

### Xpanel (builds from source)

[Docs](https://github.com/xpanel-cp/XPanel-SSH-User-Management/blob/master/fix-call.sh)
[Source](https://github.com/ambrop72/badvpn)

```bash
curl -O https://raw.githubusercontent.com/xpanel-cp/XPanel-SSH-User-Management/master/fix-call.sh
```

## run out of 403 Google

[Ref](https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh)

```bash
curl -O https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh && chmod u+x ./install_kernel.sh && ./install_kernel.sh
```

## others

[Some new repo on bad-vpn UDPGW](https://github.com/powermx/badvpn/)
