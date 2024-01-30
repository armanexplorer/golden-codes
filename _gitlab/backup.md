---
title: how to backup gitlab
---

[Docs](https://docs.gitlab.com/ee/administration/backup_restore/backup_gitlab.html?tab=Docker)

[Back up and restore](https://docs.gitlab.com/ee/administration/backup_restore/)

# backup command
```bash
docker exec -t <container name> gitlab-backup create
```

# store configuration files
backup `/srv/gitlab/config`

