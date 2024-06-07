---
title: how to configure vpn
---

[AUTO SSH VPN](https://github.com/GegeEmbrie/autosshvpn2)

## install bad_vpn script (UDPGW)

[Docs](https://gist.github.com/1nikolas/4efbfb6b0d37eba8c9ab471c55f5e892)
[Manual](https://www.youtube.com/watch?v=52lTdyu7i6c&ab_channel=E404)

```bash
OS=`uname -m`;
if [ "$OS" = "x86_64" ]; then
  sudo wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw64"
else
  sudo wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw"
fi
sudo chmod +x /usr/bin/badvpn-udpgw

sudo touch /etc/rc.local
echo "\nscreen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7303" | sudo tee -a /etc/rc.local

sudo screen -AmdS badvpn /usr/bin/badvpn-udpgw --listen-addr 127.0.0.1:7303
```

## install_kernel script

[Docs](https://www.youtube.com/watch?v=3FHJbwJOO8U&list=PL1OoRITklYLjnlTUwcBM-05Us5vj939tz&index=4&ab_channel=4rahecomputer)

```bash
wget -Nq --no-check-certificate -O ./install_kernel.sh "https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh"

chmod u+x install_kernel.sh

./install_kernel.sh

12

1
```
