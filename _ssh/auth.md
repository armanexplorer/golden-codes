---
---


# connect with password instead of auto public key
```bash
ssh -o PreferredAuthentications=password root@ip_address
```
if not worked, use this instead:
```bash
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no root@ip_address
```
