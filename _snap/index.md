---
title: all about snap package manager
---

## revert

Rever to the last version before this:

```bash
sudo sudo snap revert package_name
```

## backup files in notepad plus plus

`~/snap/notepad-plus-plus/common/.wine/drive_c/users/xxxxxx/AppData/Roaming/Notepad++/backup`

## hold

Prevent a package from update until a specified time

```bash
sudo snap refresh --hold=48h package_name
```

You can unhold when you want with:

```bash
sudo snap refresh --unhold package_name
```

## hold all

Hold all of snap packages:

```bash
sudo snap refresh --hold
```
