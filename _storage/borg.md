---
title: how to work with borg
---

[Docs](https://borgbackup.readthedocs.io/en/latest/)
[Hetzner Docs](https://community.hetzner.com/tutorials/install-and-configure-borgbackup)

```bash
cat ~/.ssh/id_ed25519.pub | ssh ht-storage install-ssh-key

export BORG_PASSPHRASE="XXXXXXXXXXXXX"
export BORG_RSH='ssh -i /home/user/.ssh/id_ed25519'

borg init --encryption=repokey ssh://storage-host/./backups
borg create ssh://storage-host/./backups::2024_6_21_initial ~/olds
borg list ssh://storage-host/./backups
```

## compression

LZMA (or xz) compression is a type of data compression algorithm used in the provided borg command. Here's a breakdown of its role:

* **Data Compression:**  During backups, borg breaks down your data into chunks. LZMA compresses these chunks, reducing their overall size. This saves storage space in your borg repository.

* **Trade-off:**  LZMA offers a high compression ratio, meaning it can significantly shrink your data. However, this comes at a cost:

    * **Slower Speeds:**  LZMA compression takes more processing power and time compared to other algorithms like zstd. This might slightly slow down your backups.

* **Choice for Backups:**  For backups, storage efficiency often outweighs speed concerns. LZMA's high compression helps maximize storage space for your backups.

**Alternative Compression Options in borg:**

The script uses `lzma` as an example, but borg supports other compression algorithms:

* **zstd:**  A modern algorithm offering good compression with faster speeds compared to LZMA. Consider this option if backup speed is a concern.

* **lz4:**  An even faster algorithm but with lower compression ratios. Use this if speed is critical and some storage inefficiency is acceptable.

**Choosing the Right Algorithm:**

The best compression algorithm depends on your priorities. If storage space is limited, LZMA is a good choice. If speed is crucial, consider zstd or even lz4. Experiment and find the best balance between compression and speed for your needs.

If you don't specify the `--compression` option in borg, it will default to using the **lz4** algorithm.

Here's why:

* **Speed Over Compression:**  Borg prioritizes speed for backups by default. lz4 is a very fast compression algorithm, making the backup process quicker.

* **Trade-off:**  lz4 offers a lower compression ratio compared to options like lzma (xz). This means your backups might occupy more storage space.

**Specifying Compression:**

To override the default and use a different compression algorithm, use the `--compression` flag followed by the desired algorithm name. Here are some examples:

* `--compression lzma`: This explicitly sets compression to lzma (higher compression, slower).
* `--compression zstd`: This uses zstd, a good balance between speed and compression.

**Choosing Wisely:**

The optimal compression choice depends on your needs. Here's a quick guideline:

* **Limited Storage:** If storage space is a major concern, consider using lzma despite the slower speeds.
* **Faster Backups:** If backup speed is critical, using zstd or even lzma with a lower compression level (e.g., `--compression lzma:3`) might be a better option.

By understanding the default behavior and available compression algorithms, you can configure borg to best suit your backup requirements.

## prune

```bash
borg prune --dry-run --list --stats --glob-archives "gitlab*" --keep-minutely 1

borg prune --dry-run --list --stats --glob-archives "gitlab*" --keep-last 1
```

A good procedure is to thin out more and more the older your backups get.
As an example, `--keep-daily` **7 means to keep the latest backup on each day,
up to 7 most recent days with backups (days without backups do not count)**.

The rules are applied from secondly to yearly, and backups selected by previous
rules do not count towards those of later rules. The time that each backup
starts is used for pruning purposes. Dates and times are interpreted in
the local timezone, and weeks go from Monday to Sunday. Specifying a
negative number of archives to keep means that there is no limit. As of borg
1.2.0, borg will retain the oldest archive if any of the secondly, minutely,
hourly, daily, weekly, monthly, or yearly rules was not otherwise able to meet
its retention target. This enables the first chronological archive to continue
aging until it is replaced by a newer archive that meets the retention criteria.

The `--keep-last` N option is doing the same as `--keep-secondly` N (and it will
keep the last N archives under the assumption that you do not create more than one
backup archive in the same second).

## delete

```bash
 borg delete --dry-run --list --stats ::gitlab_backup_XXX-XX-XX
```
