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
