---
title: all about working with gnome
---

## make theme dark

Open tweaks app > Appearance > Legacy Applications > set `Adwaita-dark`

## gnome desktop not load with correct password

[Ref](https://superuser.com/questions/371365/recovering-a-broken-gnome-desktop-in-debian-wheezy)

First of all, try to re-install the `gnome-session`:

```bash
sudo apt-get update
sudo apt-get upgrade #see if the package is held back
sudo apt-get purge gnome-session
sudo apt-get install gnome-session
startx
```

If it did not help (bad news!), install another desktops like `KDE-Plasma`. After that, try to find out the error with running different desktops and see their responses! Or maybe you should re-install gnome more completely (maybe with `sudo apt install gnome gdm3 task-gnome-desktop --reinstall` and the `sudo reboot`).
