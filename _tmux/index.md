---
title: all about working with tmux
---

## full manuals

[Ref](https://phoenixnap.com/kb/tmux-tutorial-install-commands)
[Ref2](https://deliciousbrains.com/tmux-for-local-development/)

## auto completion in bash

[Ref1](https://russellparker.me/post/2018/02/16/tmux-bash-autocomplete/)
[Ref2](https://unix.stackexchange.com/questions/604554/what-allows-bash-to-autocomplete-tmux-sub-commands)

```bash
cd /usr/share/bash-completion/completions/
wget https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux
```

## auto completion in tmux terminal

[install](https://tmux.reconquest.io/)
[basic config](https://tmux.reconquest.io/docs)

## configure history limit

Create the `~/.tmux.conf` file and put the following line there:

```bash
set-option -g history-limit 10000
```

## dump history of a session

```bash
# before dump, you should have the identifier of session, window and pane using the following commands
tmux list-sessions
tmux list-windows -t <session-name>
tmux list-panes -t <session-name>:<window-number>

# capture pane history
tmux capture-pane -t <session-name>:<window-number>.<pane-number> -S -10000 -p > ~/tmux-pane-history.txt
```

### dump all windows and their panes

If your session contains multiple windows and panes, and you want to capture the history from all of them, you can use a shell script to automate the process:

```bash
#!/bin/bash

SESSION_NAME="your-session-name"
OUTPUT_DIR="$HOME/tmux-session-history"

mkdir -p "$OUTPUT_DIR"

# Iterate through each window
tmux list-windows -t "$SESSION_NAME" -F "#{window_index}" | while read -r WINDOW_INDEX; do
  # Iterate through each pane in the window
  tmux list-panes -t "$SESSION_NAME:$WINDOW_INDEX" -F "#{pane_index}" | while read -r PANE_INDEX; do
    FILE_NAME="session-${SESSION_NAME}_window-${WINDOW_INDEX}_pane-${PANE_INDEX}.txt"
    tmux capture-pane -t "${SESSION_NAME}:${WINDOW_INDEX}.${PANE_INDEX}" -S -10000 -p > "${OUTPUT_DIR}/${FILE_NAME}"
    echo "Captured ${FILE_NAME}"
  done
done
```

## kill session

```bash
tmux kill-session -t <session-name>
```
