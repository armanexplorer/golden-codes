---
---

# Increase watchers
```bash
# see current limit
cat /proc/sys/fs/inotify/max_user_watches

# add custom settings
sudo echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf

# load value
sudo sysctl -p

# see the new limit
cat /proc/sys/fs/inotify/max_user_watches
```
[VS Code Docs](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)