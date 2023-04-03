---
---

# All about tables and chains and netfilter hooks
[best reference for iptables and its relation to linux kernel (netflix hooks)](https://www.digitalocean.com/community/tutorials/a-deep-dive-into-iptables-and-netfilter-architecture)

# Traversing of tables and chains
[Ref1](https://rlworkman.net/howtos/iptables/chunkyhtml/c962.html)

# Iptables in debian
[Ref2](https://wiki.debian.org/iptables)

# practical flgas
```bash
# List the rules in a chain or all chains (-n: numeric addresses)
iptables -L -n

# Print the rules in a chain or all chains
iptables -S -n

# table to manipulate (default: `filter')
iptables -t mangle

# add as the very first rule
iptables -I chain_name 1
```

# docker config
```bash
# block outgoing TCP traffic to destination port 80 for the country with the country code "IR" (Iran)
sudo iptables -A OUTPUT -m geoip -p tcp --destination-port 80 --dst-cc IR -j DROP

# remove all the rules from the firewall and set the default policy for all chains to ACCEPT
sudo iptables -F

# let the traffic through the docker interface reach the public ip on port 8015 (runner passed, job not passed)
sudo iptables -A INPUT -p tcp -i docker0 -d {ip_address} --dport 8015 -j ACCEPT

# (both passed)
sudo iptables -A INPUT -p tcp -d {ip_address} --dport 8015 -j ACCEPT
```


# logging in iptables
[Ref1](https://www.ibm.com/docs/hr/dsm?topic=iptables-configuring)

# iptables help
```bash
iptables v1.8.7

Usage: iptables -[ACD] chain rule-specification [options]
        iptables -I chain [rulenum] rule-specification [options]
        iptables -R chain rulenum rule-specification [options]
        iptables -D chain rulenum [options]
        iptables -[LS] [chain [rulenum]] [options]
        iptables -[FZ] [chain] [options]
        iptables -[NX] chain
        iptables -E old-chain-name new-chain-name
        iptables -P chain target [options]
        iptables -h (print this help information)

Commands:
Either long or short options are allowed.
  --append  -A chain            Append to chain
  --check   -C chain            Check for the existence of a rule
  --delete  -D chain            Delete matching rule from chain
  --delete  -D chain rulenum
                                Delete rule rulenum (1 = first) from chain
  --insert  -I chain [rulenum]
                                Insert in chain as rulenum (default 1=first)
  --replace -R chain rulenum
                                Replace rule rulenum (1 = first) in chain
  --list    -L [chain [rulenum]]
                                List the rules in a chain or all chains
  --list-rules -S [chain [rulenum]]
                                Print the rules in a chain or all chains
  --flush   -F [chain]          Delete all rules in  chain or all chains
  --zero    -Z [chain [rulenum]]
                                Zero counters in chain or all chains
  --new     -N chain            Create a new user-defined chain
  --delete-chain
             -X [chain]         Delete a user-defined chain
  --policy  -P chain target
                                Change policy on chain to target
  --rename-chain
             -E old-chain new-chain
                                Change chain name, (moving any references)
Options:
    --ipv4      -4              Nothing (line is ignored by ip6tables-restore)
    --ipv6      -6              Error (line is ignored by iptables-restore)
[!] --proto     -p proto        protocol: by number or name, eg. `tcp'
[!] --source    -s address[/mask][...]
                                source specification
[!] --destination -d address[/mask][...]
                                destination specification
[!] --in-interface -i input name[+]
                                network interface name ([+] for wildcard)
 --jump -j target
                                target for rule (may load target extension)
  --goto      -g chain
                               jump to chain with no return
  --match       -m match
                                extended match (may load extension)
  --numeric     -n              numeric output of addresses and ports
[!] --out-interface -o output name[+]
                                network interface name ([+] for wildcard)
  --table       -t table        table to manipulate (default: `filter')
  --verbose     -v              verbose mode
  --wait        -w [seconds]    maximum wait to acquire xtables lock before give up
  --wait-interval -W [usecs]    wait time to try to acquire xtables lock
                                default is 1 second
  --line-numbers                print line numbers when listing
  --exact       -x              expand numbers (display exact values)
[!] --fragment  -f              match second or further fragments only
  --modprobe=<command>          try to insert modules using this command
  --set-counters PKTS BYTES     set the counter during insert/append
[!] --version   -V              print package version.
```