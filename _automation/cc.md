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

### remove old ssh host key (optional)

In case of problem to connect to host, maybe you should remove old remote host key from your local:

```bash
ssh-keygen -f "/home/arman/.ssh/known_hosts" -R "<remote_ip>"
```

### open the remote host and clone ipa-private

Open the remote host in VSCode to be able to pull codes from private repos

```bash
git clone --single-branch --branch cg https://github.com/armanexplorer/ipa-private-arman.git ~/ipa-private
```

### increase file watchers

```bash
(cd ~/ipa-private && make increase-file-watchers)
```

### install extensions

```bash
(cd ~/ipa-private && make install-vscode-extensions)
```

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

## build yolo base image

```bash
(cd ~/ipa-private && make build_yolo_image)
```

## download yolo repo and weights

```bash
(cd ~/ipa-private && make download_yolo_repo && make download_yolo_weights && make push_yolo_to_minio)
```

## setup single pod watcher (SPW)

```bash
(cd ~/ipa-private && make install-single-pod-watcher)
```

## delete this in ubuntu 20

```bash
sudo iptables -D FORWARD -j REJECT --reject-with icmp-host-prohibited || true
```
