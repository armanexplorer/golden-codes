---
title: how to set up infru. of cc servers with MPS gpu equipped
---

## clone ipa through terminal using HTTPS

```bash
https://github.com/armanexplorer/ipa-arman.git
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

- Open the remote host in VS Cdoe to be able to pull codes from private repos
- install `@id:ms-python.python` extension
- install `jupyter` extension
- install `@id:ms-vscode.makefile-tools` extension (optional)

## clone ipa-private using HTTPS

```bash
https://github.com/armanexplorer/ipa-private-arman.git
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

Open tmux and run build.sh script

```bash
tmux
~/ipa/infrastructure/build.sh
```

## build yolo model

```bash
cd ~/ipa-private
make build_yolo
```

## setup single pod watcher (SPW)

```bash
cd ~/ipa-private
make install-single-pod-watcher
```
