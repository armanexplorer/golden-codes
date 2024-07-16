---
title: how to work with gpg keys in linux
---

## Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg)

[Fix Deprecated](https://askubuntu.com/questions/1403556/key-is-stored-in-legacy-trusted-gpg-keyring-after-ubuntu-22-04-update)


This answer is a customization of the one provided by matigo user here. You need to export the GPG key from the deprecated keyring and store it in /usr/share/keyrings for every repo.

Let's begin with `DigitalOcean` key. Open terminal and export the `9FE3 B226 BD77 5196 D8C2  E599 DE88 104A A4C6 383F` key:

```bash
apt-key export A4C6383F | sudo gpg --dearmour -o /usr/share/keyrings/digitalocean-agent.gpg
```

Note: The `A4C6383F` value comes from the last 8 characters of the pub code from the apt-key list output.

Now we can update our apt source file (`/etc/apt/sources.list.d/digitalocean-agent.list`), adding a signed-by tag. Open it by:

```bash
sudo nano /etc/apt/sources.list.d/digitalocean-agent.list
```

and add the tag `[arch=amd64 signed-by=/usr/share/keyrings/digitalocean-agent.gpg]` just after the deb keyword and before the URL.

I don't know the exact content of `digitalocean-agent.list`, but it should be eventually something similar to:

```conf
deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] packages.microsoft.com/repos/edge stable main
```

Run `sudo apt update` to confirm the message is gone

If the message is gone, remove the original signature:

```bash
sudo apt-key del A4C6383F
```
