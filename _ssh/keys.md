---
title: all about ssh keys
---

## convert PuTTY .ppk keys to OpenSSH format

[Link](https://megamorf.gitlab.io/2020/05/06/how-to-convert-putty-ppk-key-to-openssh-format/)

```bash
puttygen id_rsa.ppk -O private-openssh -o id_rsa
puttygen id_rsa.ppk -O public-openssh -o id_rsa.pub


mv -i ~/id_rsa* ~/.ssh/ # -i is being used to make sure not overwrite
chmod 400 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
```
