---
title: how we can use BIND9
---

[Docs](https://www.isc.org/bind/)

## install

[Link](https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-caching-or-forwarding-dns-server-on-ubuntu-16-04)

[Link2](https://www.unixmen.com/setting-forwarding-dns-server-debian/)

[Link3](https://cloudinfrastructureservices.co.uk/how-to-install-bind-dns-on-debian-11-server-setup-configure/)

[Link4](https://www.linuxbabe.com/ubuntu/set-up-local-dns-resolver-ubuntu-20-04-bind9)

[Link5](https://www.linuxbuzz.com/setup-bind-dns-server-on-debian/)

```bash
# install packages
sudo apt-get update
sudo apt-get install bind9 bind9utils bind9-doc

# set BIND to IPv4 mode since our private networking uses IPv4 exclusively
# note: the /etc/default/named will be used as env in `named.service`
sed -i 's/OPTIONS="-u bind"/OPTIONS="-u bind -4"/' /etc/default/named
sudo systemctl restart named

# config named
cd /etc/bind
```

Edit `named.conf.options`:

```cpp
acl allowed_clients {
  localhost;
};
options {
    directory "/var/cache/bind";
    
    recursion yes;
    allow-recursion { allowed_clients; };   
    allow-query { allowed_clients; };
    listen-on { localhost; };       
    allow-transfer { none; };

    forwarders {
        1.1.1.1;
        8.8.8.8;
    };
    forward only;

    querylog yes;

    dnssec-validation no;
    listen-on-v6 { any; };
    version "not available"; // Disable for security
}
```

Edit `named.conf.local`:
[Forward zone samples](https://gist.github.com/derdanu/74399485c3987808904cfffb4834777e)

```cpp
zone "googleapis.com" {
    type forward;
    forward only;
    forwarders {
        1.2.3.4;
        5.6.7.8;
    };
};
```

You can also add zones with master type to make set its url to private networks:
[Ref](https://www.richinfante.com/2020/02/21/bind9-on-my-lan)

Check everything is OK and restart `named.service`:

```bash
# check main configs
sudo named-checkconf  /etc/bind/named.conf

# check custom zone configs (if there are any)
sudo named-checkzone example.com /etc/bind/db.example.com

# apply changes
sudo systemctl restart named
#or
sudo rndc reconfig
```

Now, change the `/etc/resolv.conf` to use `bind`:
`nameserver 127.0.0.1`

## Bind as server

[Debian Docs](https://wiki.debian.org/Bind9)
[Digital Ocean Docs](https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-debian-9)

## Bind as caching or forwarding

[Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-caching-or-forwarding-dns-server-on-ubuntu-16-04)

## troubleshooting

[broken trust chain resolving](https://access.redhat.com/solutions/5633621)
[dnssec](https://serverfault.com/questions/788755/bind9-does-not-resolve-dnssec-correctly)
