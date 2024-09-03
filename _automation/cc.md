---
title: how to set up infrastructure of cc servers with MPS gpu equipped
---

## system

You MUST have `Ubuntu20.04` system.

## clone ipa through terminal using HTTPS

```bash
git clone https://github.com/armanexplorer/ipa-arman.git ~/ipa
```

## disable man-db cache re-indexing (make system slow in lower than 2.10 versions)

```bash
sudo mv /var/lib/man-db/auto-update /var/lib/man-db/auto-update.bak
```

## install zsh

```bash
source ~/ipa/infrastructure/hack/zsh.sh
install_zsh

source ~/ipa/infrastructure/hack/zsh.sh
customize_zsh
```

## VS Code

Work with VS Code to clone private repo and enabling jupyter

### remove old ssh host key

Run this in your local system with the remote server IP instead of the following

```bash
ssh-keygen -f "/home/arman/.ssh/known_hosts" -R "192.5.87.154"
```

### open the remote host and clone ipa-private

Open the remote host in VSCdoe to be able to pull codes from private repos

```bash
git clone --single-branch --branch cg https://github.com/armanexplorer/ipa-private-arman.git ~/ipa-private
```

Enable VSCode extensions:

- `@id:ms-python.python`
- `@id:ms-toolsai.jupyter`
- `@id:ms-vscode.makefile-tools`  (optional - makefile formatter)
- `@id:foxundermoon.shell-format` (optional - bash formatter)

## config git credentials

To be able to make authorized commits

```bash
# set name and email
git config --global user.name "Arman Mazloumzadeh"
git config --global user.email "armanexplorer@gmail.com"

# verify name and email
git config --list | cat
```

## run build.sh

Open tmux and run `build.sh` script

```bash
# open tmux
tmux

# run build code
~/ipa/infrastructure/build.sh
```

## add gpu (optional)

```bash
# open tmux (prevent from manipulating shell behavior with ``set -e``)
tmux

source ~/ipa/infrastructure/hack/gpu.sh
```

### with MPS partitioning

```bash
enable_mps_gpu
```

### single GPU

```bash
enable_single_gpu
```

## build yolo model

```bash
(cd ~/ipa-private && make build_yolo)
```

## setup single pod watcher (SPW)

```bash
(cd ~/ipa-private && make install-single-pod-watcher)
```
