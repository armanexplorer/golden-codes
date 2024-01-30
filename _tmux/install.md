---
---

# install

Many platforms provide pre-built packages of tmux (`apt install tmux`), although these are often out of date
[Repo](https://github.com/tmux/tmux/wiki/Installing)

```bash
# run packages
apt install libevent ncurses

# buiold packages
apt install libevent-dev ncurses-dev build-essential bison pkg-config

# build
tar -zxf tmux-*.tar.gz
cd tmux-*/
./configure
make && sudo make install
```

To install elsewhere add `--prefix` to configure, for example for `/usr` add `--prefix=/usr`.
