---
title: all about network interface
---

## temp add ip

```bash
sudo ip addr add x.y.z.w dev eth0
```

## add ip permenently to interafce

**Note**: In the `/etc/network/interfaces.d/`, the first files in alphabetic order have more priority. Usually, the default interface file there will start with `50-`. So you can use `40` for more priority config and `60` for low priority ones.

### Hetzner Suggests

[Docs](https://docs.hetzner.com/cloud/floating-ips/persistent-configuration/)

```bash
touch /etc/network/interfaces.d/60-my-floating-ip.cfg
nano /etc/network/interfaces.d/60-my-floating-ip.cfg

auto eth0:1
iface eth0:1 inet static
    address your.Float.ing.IP
    netmask 32

sudo service networking restart
```

### New method

You can only use the network interface twice instead of adding `:1` to it like this:

```bash
iface eth0 inet static
    address YOUR_IP_ADDRESS/THE_SUBNET_MASK
```

## check the interface is virtual or not

If it returns a true physical mac address, it is physical (not virtual)

```bash
ethtool -P eth0
```

## list of virtula devices

```bash
ls -a /sys/devices/virtual/net
```
