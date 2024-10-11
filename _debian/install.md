---
title: all about installations in Debian
---

## some partitioning info

```bash
sudo resize2fs -P /dev/nvme0n1p5
# The blocks which is used by the filesystem: 54478434
# This is equal to: 207.8 GB

sudo dumpe2fs -h /dev/nvme0n1p5 | grep 'Block count'
# The blocks dedicated to the nvme0n1p5 is: 84819968
# This is equal to: 323.5625 GB (matches with lsblk, but not with df -h)
```

1 Sector : 512B
8 Sectors: 4K = 1 block


So:
1000000 Sectors = 512*1000000 / (1024*1024*1024) G ~
1000000 blocks = 4*1000000 / (1024*1024) G ~ 3.81 G


## shrink root partition

```bash
# do these all in the Live CD Image of Debian (e.g., debian live standard image)

sudo e2fsck -f /dev/nvme0n1p5

sudo resize2fs /dev/nvme0n1p5 297G

sudo fdisk /dev/nvme0n1
p (note start sector of p5)
d
5
n
5
(write what noted as start sector)
+298G
p
w

sudo resize2fs /dev/nvme0n1p5

sudo e2fsck -f /dev/nvme0n1p5

sudo reboot
```

## swap

[Docs](https://wiki.debian.org/Swap)

[Some Not Bad Link](https://docs.vultr.com/how-to-add-swap-memory-on-debian-12)

### add swap

```bash
# start from Live CD Image
sudo fdisk /dev/nvme0n1
n
6
default
default
t
19 (which is Linux Swap)
p
w

# leave the Live CD
sudo reboot

# open main system
sudo mkswap /dev/nvme0n1p6

sudo swapon /dev/nvme0n1p6

# get the UUID
blkid

sudo nano /etc/fstab
# append this there:
/dev/nvme0n1p6 none swap sw 0 0
# or (this is like the swap when install OS)
UUID= xxxx-xxxx-xxxx-xxxx none swap sw 0 0

# check
sudo swapon --show
free -h

```

## swappiness

```bash
# view the active swappiness
cat /proc/sys/vm/swappiness

# change it
sudo sysctl vm.swappiness=10

# reload sysctl to apply this change
sudo sysctl -p

# check the new value
cat /proc/sys/vm/swappiness
```

Swappiness is a kernel parameter that determines the balance between using swap space and RAM. Swappiness value range from `0` to `100`, where lower values such as `0` reduce swapping and higher values `100` prioritize swapping of processes from RAM to the swap memory.

- 0: Enables the system to avoid swapping processes out of physical memory.
- 1-49: Enables swapping with reduced usage unless the main memory (RAM) is at capacity.
- 50: Balances swapping and memory caching on the server.
- 51-99: Increases swapping from the main memory to swap memory.
- 100: Prioritizes swapping on the server and processes are continuously moved from RAM to swap.
