---
title: how to work with gpg keys in apt
---

## add new ppa repo (auto gpg sign)

```bash
sudo apt-get update
sudo apt-get install -y software-properties-common python3-software-properties python3-launchpadlib

sudo add-apt-repository ppa:someuser/somerepo
```

## Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg)

[Fix Deprecated](https://askubuntu.com/questions/1403556/key-is-stored-in-legacy-trusted-gpg-keyring-after-ubuntu-22-04-update)

### create gpg key in new format

You need to export the GPG key from the deprecated keyring and store it in `/usr/share/keyrings` for every repo.

Let's begin with `DigitalOcean` key. Open terminal and export the `9FE3 B226 BD77 5196 D8C2  E599 DE88 104A A4C6 383F` key:

```bash
apt-key export A4C6383F | sudo gpg --dearmour -o /usr/share/keyrings/digitalocean-agent.gpg
```

Note: The `A4C6383F` is the key-id and comes from the last 8 characters of the pub code from the apt-key list output.

### if this is new ppa repo

You should first find the `key-id` of the repo using one of the following methods:

- Using Script: You can find the key-id automatically using [this script](#get-key-id-and-gpg-key-using-script)

- Launchpad Repo Page: In a page like this `https://launchpad.net/~alessandro-strada/+archive/ubuntu/ppa` in launchpad by opening the `Technical details about this PPA` section and right below the `Signing Key` or `Fingerprint`.

- Other: if you did not find it and you get error after adding its source but not its key, in the error you can find a `key-id` that can be used either, like this error:

```bash
The following signatures couldn't be verified because the public key is not available: NO_PUBKEY FEAC8456AF83AFEB NO_PUBKEY AD5F235DF639B041
```

In the above case, the first error (`FEAC8456AF83AFEB`) is the last 8 digits of the `Fingerprint` in the repo ppa page.

After finding the `key-id`, you can download and store the gpg key like this (replace <key-id> with the value found):

```bash
wget -qO - https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x<key-id> | gpg --dearmor | sudo tee /usr/share/keyrings/alessandro-strada-archive-keyring.gpg > /dev/null
```

Or you can use `gpg` cli tool:

```bash
gpg --keyserver keyserver.ubuntu.com --recv-keys "$KEY_ID"
```

### add repo source if not yet

Now we can update our apt source file (`/etc/apt/sources.list.d/digitalocean-agent.list`), adding a `signed-by` tag. Open it by:

```bash
sudo nano /etc/apt/sources.list.d/digitalocean-agent.list
```

and add the tag `[arch=amd64 signed-by=/usr/share/keyrings/digitalocean-agent.gpg]` just after the `deb` keyword and before the URL.

Not sure, but `digitalocean-agent.list` content should be eventually something like this:

```conf
deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] packages.microsoft.com/repos/edge stable main
```

Below, this is a working case from ppa:

```conf
deb [signed-by=/usr/share/keyrings/alessandro-strada-archive-keyring.gpg] http://ppa.launchpad.net/alessandro-strada/ppa/ubuntu focal main
```

### update to fetch package metadata

Run `sudo apt update` to confirm the message is gone

If the deprecated warning is gone, you can remove the old-way stored gpg key like this:

```bash
sudo apt-key del A4C6383F
```

### get key-id and gpg key using script

Here is a script to automatically fetch the key-id form the repo page only using the repo name:

```bash
#!/usr/bin/env bash
#
# get-ppa-key.sh
# --------------
# Usage:
#   ./get-ppa-key.sh ppa:someuser/somerepo
#
# Description:
#   Scrapes Launchpad for the GPG key of the specified PPA.

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <PPA name> (e.g. $0 ppa:ubuntu-toolchain-r/test)"
  exit 1
fi

PPA=$1

# Remove "ppa:" prefix, then extract user and repo parts
# e.g. ppa:ubuntu-toolchain-r/test -> user="ubuntu-toolchain-r", repo="test"
TMP=${PPA#ppa:}            # Remove 'ppa:' prefix
USER=${TMP%/*}             # Extract text up to first slash
REPO=${TMP#*/}             # Extract text after slash

# Construct Launchpad URL for PPA
LAUNCHPAD_URL="https://launchpad.net/~${USER}/+archive/ubuntu/${REPO}"

echo "Fetching Launchpad page: $LAUNCHPAD_URL"
HTML=$(curl -s "$LAUNCHPAD_URL")

# Scrape the "Signing key" block and find something like 0x1234ABCD
# We look between 'Signing key' and 'Fingerprint'
KEY_ID=$(echo "$HTML" \
  | sed -n '/Signing key/,/Fingerprint/p' \
  | grep -oE '0x[A-Fa-f0-9]+' \
  | head -n 1)

if [ -z "$KEY_ID" ]; then
  echo "Error: No GPG key found for $PPA"
  exit 1
fi

echo "GPG key for $PPA is: $KEY_ID"

# If you want to actually retrieve/import the key into your keyring, uncomment below:
# gpg --keyserver keyserver.ubuntu.com --recv-keys "$KEY_ID"
```
