#!/bin/bash

# Backup directory path
BACKUP_DIR=/var/opt/gitlab/backups

# Borg repository location
BORG_REPO=ssh://user@backup_server:/path/to/borg/repo

# Create GitLab backup
sudo gitlab-backup create

# Archive the backup directory with borg
borg create --verbose --files --compression lzma ${BORG_REPO}::gitlab_backup_{date} \
    ${BACKUP_DIR}

# (Optional) Remove old backups (adjust retention policy as needed)
borg prune -m 7 --prefix {gitlab_backup_} ${BORG_REPO}

# Clean up temporary backup files (optional)
# rm -rf ${BACKUP_DIR}/*
