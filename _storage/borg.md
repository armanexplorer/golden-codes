---
title: how to work with borg
---

```bash
cat ~/.ssh/id_ed25519.pub | ssh ht-storage install-ssh-key

export BORG_PASSPHRASE="XXXXXXXXXXXXX"
export BORG_RSH='ssh -i /home/user/.ssh/id_ed25519'

borg init --encryption=repokey ssh://storage-host/./backups
borg create ssh://storage-host/./backups::2024_6_21_initial ~/olds
borg list ssh://storage-host/./backups
```
