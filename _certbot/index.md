---
title: how to work with certbot?
---

[Usage Docs](https://eff-certbot.readthedocs.io/en/latest/using.html)

## expand domans of a certificate

Add new domains to an existing certificate

### method1

[Docs](https://eff-certbot.readthedocs.io/en/latest/using.html#changing-a-certificate-s-domains)

```bash
# shrink extra domains
certbot certonly --cert-name example.com -d example.com

# expand domains
certbot certonly --cert-name example.com -d example.org,www.example.org
```

### method2

[Docs](https://eff-certbot.readthedocs.io/en/latest/using.html#re-creating-and-updating-existing-certificates)

Consider using --cert-name instead of --expand, as it gives more control over which certificate is modified and it lets you remove domains as well as adding them.

```bash
certbot --expand -d existing.com,example.com,newdomain.com

# or
certbot --expand -d existing.com -d example.com -d newdomain.com
```

## install multi-domain certifiacete

```bash
certbot certonly -d example.com -d www.example.com
```
