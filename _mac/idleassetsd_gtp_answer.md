---
title: how to prevent idleassetsd from eating the bandwidth
description: ChatGTP explains three effective ways to stop idleassetsd from eating network
---

### Why that error happens

* `launchctl unload` is **deprecated** on newer macOS; Apple wants you to use `bootstrap/bootout`. Even then, many **Apple-signed system agents/daemons are protected by SIP**, so unloading them usually fails (you see EIO/5). ([Stack Overflow][1])

### Practical ways that actually stop the downloads

Below are the 3 approaches that have worked for people when `launchctl` won’t cooperate. You can do just #1, but #2 or #3 make it stick.

---

## 1) Stop the trigger (screen saver/wallpaper)

* System Settings → **Screen Saver**: pick a **static** one (not “Aerial/Apple TV”/animated).
* System Settings → **Wallpaper**: pick a **static** photo (avoid “Shuffle”/dynamic/animated).
  This removes the reason `idleassetsd` keeps fetching gigabytes. (Multiple reports point to animated/Aerial assets as the cause.) ([Ask Different][2])

---

## 2) Nuke the already downloaded cache (safe)

Open Terminal and run:

```bash
sudo rm -rf "/Library/Application Support/com.apple.idleassetsd/Customer/"*
```

This reclaims the space; it will only re-download if the triggers in #1 are still on. (Users have confirmed this is where those multi-GB videos live.) ([MacRumors Forums][3])

---

## 3) Block the network call (works even if the process respawns)

Since unloading is blocked, **deny its traffic**. Two easy options:

### Option A — Add a hosts entry (quick & free)

Some users stopped the flood by blocking one of Apple’s endpoints used by `idleassetsd`:

```bash
sudo sh -c 'printf "\n# Block idleassetsd fetches\n127.0.0.1 sylvan.apple.com\n" >> /etc/hosts'
sudo dscacheutil -flushcache
```

Reboot (or toggle Wi-Fi off/on). This prevents connections to that host; reports say it halts the data spike. You can remove the line later to revert. ([Apple Support Community][4])

> Note: `aaplimg.com` is also used, but `/etc/hosts` can’t wildcard subdomains. If traffic continues, use Option B.

### Option B — Use an outbound firewall (best control)

Install **LuLu** (free) or **Little Snitch** (paid) and **block `idleassetsd`** (or block the domains it hits). This reliably stops the downloads even if the process keeps respawning. ([Ask Different][2])

---

## If you still want to try `launchctl`

For completeness, the modern command is:

```bash
# For system daemons (root)
sudo launchctl bootout system /System/Library/LaunchDaemons/com.apple.idleassetsd.plist

# For per-user agents (if it exists as an agent)
launchctl bootout gui/$UID /System/Library/LaunchAgents/com.apple.idleassetsd.plist
```

…but on current macOS this commonly fails due to SIP protection (that’s the **EIO/5** you’re hitting). Blocking traffic (#3) is the reliable workaround. ([Stack Overflow][1])

---

### Quick “do this now” path

1. Switch to **static** screen saver + wallpaper. ([Ask Different][2])
2. Delete the cache (command in #2). ([MacRumors Forums][3])
3. Add the **hosts** line (or install **LuLu** and block `idleassetsd`). ([Apple Support Community][4])

If you want, tell me which route you prefer (hosts vs. LuLu), and I’ll give you the exact steps/screens to click through.

[1]: https://stackoverflow.com/questions/78246166/launchctl-bootout-on-macos-sonoma-is-failing-with-eio-input-output-error?utm_source=chatgpt.com "launchctl bootout on macOS Sonoma is failing with EIO = \"Input/output ..."
[2]: https://apple.stackexchange.com/questions/461119/unable-to-stop-process-idleassetsd-from-consuming-infinite-bandwidth-on-macos?utm_source=chatgpt.com "Unable to stop Process \"idleassetsd\" from consuming infinite bandwidth ..."
[3]: https://forums.macrumors.com/threads/wallpaper-screensavers-take-up-26gb-how-to-delete.2431871/?utm_source=chatgpt.com "Wallpaper/Screensavers take up 26gb, how to delete?"
[4]: https://discussions.apple.com/thread/255329956?utm_source=chatgpt.com "High Band With \"idleassetsd\" & \"nsurlses… - Apple Community"
