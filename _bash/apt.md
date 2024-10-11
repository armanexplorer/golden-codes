---
title: apt and apt-get hacks
---


## only upgrade one package

```bash
sudo apt-get install --only-upgrade man-db
```

## DEBIAN_FRONTEND=noninteractive

Example:

```bash
DEBIAN_FRONTEND=noninteractive apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-ce-rootless-extras docker-buildx-plugin >/dev/null
```

## find and install package

- **List installed packages**: `apt list --installed`
- **Check a specific package**: `apt list package_name`
- **List all versions**: `apt list --all-versions package_name`
- **Check policy**: `apt-cache policy package_name`
- **List available packages in table**: `apt-cache madison package_name`
- **Install specific version**: `sudo apt install package_name=package_version`
- **Simulate installation**: `apt-get install -s package_name`

## using dpkg

```bash
# list all installed packages
dpkg -l

# Query Package Status
dpkg -s package_name | grep Version
```
