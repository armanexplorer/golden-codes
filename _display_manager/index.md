---
title: all dispaly managers
---

## gdm3

This is the default for gnome

## sdde

This installs with KDE-Plasma

## revert to gdm3

```bash
# Note: this will throw some error but after reboot everything should be OK
sudo dpkg-reconfigure gdm3 

sudo reboot
```
