---
title: how to fetch and mount a remote drive into local filesystem
---

[Link](https://www.baeldung.com/linux/google-drive-guide#2-rclone)
[Doc](https://rclone.org/drive/)

## config remote

```bash
rclone config
```

- Select `n` for a new remote, which is a named remote storage system
- Enter a name for our remote, like gdrive
- Enter the number for Google Drive, which is `17` in rclone 1.67.0
- You can Leave `client_id` and `client_secret` empty unless we have our own Google API credentials. But rclone says "Setting your own is recommended."
- [If you want to have an app for your own, create an app in Google Cloud Console with Google Drive access and oauth support to receive client_id and secret. Then add your intended Google Drive email to the allowed list of that app.]
- Choose `1` for `full access`
- Leave the service_account_file `empty` (by pressing enter)
- Avoid advanced configuration (Edit advanced config) with `n`
- Choose `y` to authenticate rclone with a browser
- Avoid configuring a shared drive (Team Drive) with `n`
- Select `y` to confirm the configuration
- Choose `q` to finish the configuration

## mount

```bash
mkdir ~/mylocalfolder
rclone mount --daemon --vfs-cache-mode full gdrive:/ ~/mylocalfolder/
```

## unmount

You can do both:

- click on `eject` through File Manager
- run this:

```bash
# I am not sure about this
fusermount -u ~/mylocalfolder` # will delete related mount row from /etc/mtab
```
