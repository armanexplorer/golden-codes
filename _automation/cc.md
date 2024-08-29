---
title: how to set up infrastructure of cc servers with MPS gpu equipped
---

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

### open the remote host

- Open the remote host in VS Cdoe to be able to pull codes from private repos
- install `@id:ms-python.python` extension
- install `@id:ms-toolsai.jupyter` extension
- install `@id:ms-vscode.makefile-tools` extension (optional - makefile formatter)
- install `@id:foxundermoon.shell-format`extension (optional - bash formatter)

## clone ipa-private using HTTPS

```bash
git clone --single-branch --branch cg https://github.com/armanexplorer/ipa-private-arman.git ~/ipa-private
```

## config git credentials

To be able to make authorized commits

```bash
# set name and email
git config --global user.name "Arman Mazloumzadeh"
git config --global user.email "armanexplorer@gmail.com"

# check
git config --list
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
