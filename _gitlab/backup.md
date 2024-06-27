---
title: how to backup gitlab
---

[Docs](https://docs.gitlab.com/ee/administration/backup_restore/backup_gitlab.html)

[Omnibus-Docs](https://docs.gitlab.com/omnibus/settings/backups.html)

## backup applicatoin

```bash
docker exec -t <your container name> gitlab-backup
```

## backup config

```bash
docker exec -t <your container name> /bin/sh -c 'gitlab-ctl backup-etc && cd /etc/gitlab/config_backup && cp $(ls -t | head -n1) /secret/gitlab/backups/'

# or more simply (warn: you should take care of the secrets as above do!):
docker exec -t <your container name> gitlab-ctl backup-etc
```

[Upload backups to remote](https://docs.gitlab.com/ee/administration/backup_restore/backup_gitlab.html#upload-backups-to-a-remote-cloud-storage)

[Configure cron to make daily backups](https://docs.gitlab.com/ee/administration/backup_restore/backup_gitlab.html#configuring-cron-to-make-daily-backups)

[Prune old backups](https://docs.gitlab.com/ee/administration/backup_restore/backup_gitlab.html#limit-backup-lifetime-for-local-files-prune-old-backups)
