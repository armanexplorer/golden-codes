---
title: all about configuring dkim in DMS
---

[Docs](https://docker-mailserver.github.io/docker-mailserver/latest/config/best-practices/dkim_dmarc_spf/#dkim)

## ramspamd multiple domain

If you have multiple domains, you need to:

Create a key wth

```bash
docker exec -it <CONTAINER NAME> setup config dkim domain <DOMAIN>
```

for each domain DMS should sign outgoing mail for.
Provide a custom dkim_signing.conf (for which an example is shown below), as the default config only supports one domain.

smaple:

```conf
# documentation: https://rspamd.com/doc/modules/dkim_signing.html

enabled = true;

sign_authenticated = true;
sign_local = true;

use_domain = "header";
use_redis = false; # don't change unless Redis also provides the DKIM keys
use_esld = true;
check_pubkey = true; # you want to use this in the beginning

selector = "mail";
# The path location is searched for a DKIM key with these variables:
# - `$domain` is sourced from the MIME mail message `From` header
# - `$selector` is configured for `mail` (as a default fallback)
path = "/tmp/docker-mailserver/dkim/keys/$domain/$selector.private";

# domain specific configurations can be provided below:
domain {
    example.com {
        path = "/tmp/docker-mailserver/rspamd/dkim/mail.private";
        selector = "mail";
    }
    example2.com {
        path = "/tmp/docker-mailserver/rspamd/dkim/mail.private";
        selector = "mail";
    }
}
```
