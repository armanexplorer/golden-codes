---
title: how to control the hot corners
---

## Method 1 (worked)

To disable the top-left corner and prevent open Activities Overview, Go to this settings:

1. Open the `settings`
2. Type `multitasking` and open it
3. In `General`, toggle off Hot Corner

## Method 2

You can also use command line:

```bash
gsettings set org.gnome.desktop.interface enable-hot-corners false

# check
gsettings get org.gnome.desktop.interface enable-hot-corners
```
