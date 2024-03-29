---
title: advanced configs of postfix and other services
---

## postfix

[Docs](https://docker-mailserver.github.io/docker-mailserver/latest/config/advanced/override-defaults/postfix/)

[Default Postfix master.cf](https://github.com/docker-mailserver/docker-mailserver/blob/master/target/postfix/master.cf)

[Default Postfix main.cf](https://github.com/docker-mailserver/docker-mailserver/blob/master/target/postfix/main.cf)

## prevent spam and brute force

Based on the search results provided, here are the steps you can take to block an IP address from accessing your Docker-based mail server:

- Use the `iptables` command to add a rule to the `DOCKER-USER` chain to block the IP address:

```bash
iptables -I DOCKER-USER -s <IP_ADDRESS> -j DROP
```

Replace `<IP_ADDRESS>` with the IP address you want to block. This will add a rule to the `DOCKER-USER` chain to drop all traffic from the specified IP address.

- To verify the rule has been added, run:

```bash
iptables -L DOCKER-USER
```

- If you want to log the dropped traffic from the `DOCKER-USER` chain, you can add an additional rule:

```bash
# log all the dropped traffic from the `DOCKER-USER` chain
iptables -A DOCKER-USER -j LOG
```

Keep in mind that blocking an IP address may not be a long-term solution, as the offender's IP address could change. It's better to focus on blocking repeat offenders and periodically checking the RBLs (Real-time Blackhole Lists) to see if the IP has been removed, indicating the owner has fixed the issue.

Another approach is to use the `fail2ban` tool, which can automatically detect and block IP addresses that are attempting to brute-force your mail server. The search results mention a potential issue with `fail2ban` when running behind a proxy, but there are workarounds available.

In summary, the key steps are to use `iptables` to block the specific IP address, and consider using a tool like `fail2ban` to automatically manage the blocking of malicious IP addresses.
