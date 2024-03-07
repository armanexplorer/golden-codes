---
title: all about configuring ips
---

## add second IP addresss

[Ref](https://www.garron.me/en/linux/add-secondary-ip-linux.html)
[Ref](https://askubuntu.com/questions/1013021/add-second-ip-address-to-interface-in-17-10)

```bash
# create new low priority config file
cat <<EOF > /etc/network/interfaces.d/100-cloud-init
iface eth0 inet static
    address XXX.YY.ZZZ.AAA/24
```

## challenges

[old or new style](https://serverfault.com/questions/583587/whats-the-difference-between-eth01-and-2nd-eth0)

[Two gateway problem](https://askubuntu.com/questions/293827/error-rtnetlink-answers-file-exists)

[Don't use two gateway](https://raspberrypi.stackexchange.com/a/13896)

## test ifup

```bash
ifup --no-act eth0
```

The output:

```bash
/bin/run-parts --exit-on-error /etc/network/if-pre-up.d

/sbin/ip addr add AAA.BB.CCC.DDD/255.255.255.0 broadcast AAA.BB.CCC.255 dev eth0 label eth0
/sbin/ip link set dev eth0 up
/sbin/ip route add default via AAA.BB.CCC.DDD dev eth0 onlink

/bin/run-parts --exit-on-error /etc/network/if-up.d
```

## flags

--force: Force configuration or deconfiguration of the interface.
--ignore-errors: If any of the commands of scripts fails, continue
--no-act: Don't configure any interfaces or run any "up" or "down" commands.
