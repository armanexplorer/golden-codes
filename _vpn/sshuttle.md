---
title: sshuttle, ssh vpn for linux
---

[Docs](https://sshuttle.readthedocs.io/en/stable/manpage.html)

[Good Example](https://arazgholami.medium.com/using-ssh-tunneling-as-vpn-with-clients-for-mac-linux-windows-and-ios-android-tv-6e80e98d1e16)

[Another example]([sshuttle](https://perfecto25.medium.com/using-sshuttle-as-a-service-bec2684a65fe))

## add UDP

According to [Docs](https://sshuttle.readthedocs.io/en/latest/requirements.html), we should support TPROXY to let sshuttle use `TPROXY` method ([--method](https://sshuttle.readthedocs.io/en/stable/manpage.html#cmdoption-sshuttle-method)):

[TPROXY DOCS](https://www.kernel.org/doc/html/v5.8/networking/tproxy.html)

[TPROXY Descriptions](https://serverfault.com/questions/1056072/what-is-the-purpose-of-tproxy-how-should-you-use-it-and-what-happens-internally)

[TPROXY in use](https://github.com/FarFetchd/simple_tproxy_example)
