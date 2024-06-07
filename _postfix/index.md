---
title: Mail Server
description: Complete guilde of Setteling up a Mail Server step by step
---

# BEST: Tested and Worked
[Part1: set up a basic Postfix SMTP server](https://www.linuxbabe.com/mail-server/setup-basic-postfix-mail-sever-ubuntu)

[Part2: receive and send emails using a desktop email client](https://www.linuxbabe.com/mail-server/secure-email-server-ubuntu-postfix-dovecot)

[Part3 (MySQL): Create Virtual Mailboxes on Ubuntu Mail Server](https://www.linuxbabe.com/mail-server/postfixadmin-ubuntu)

[Part3 (Postgres): Create Virtual Mailboxes on Ubuntu Mail Server](https://www.linuxbabe.com/mail-server/postfixadmin-ubuntu-postgresql)

[Part4: DKIM and SPF](https://www.linuxbabe.com/mail-server/setting-up-dkim-and-spf)

[Part5: DMARK](https://www.linuxbabe.com/mail-server/create-dmarc-record)

[Part6: Prevent being marked as spam](https://www.linuxbabe.com/mail-server/how-to-stop-your-emails-being-marked-as-spam)

# Postscreen
[Postscreen](https://www.linuxbabe.com/mail-server/configure-postscreen-in-postfix-to-block-spambots)

# Block and antispam
[Block and Filter](https://www.linuxbabe.com/mail-server/block-email-spam-check-header-body-with-postfix-spamassassin)

[OpenDMARC](https://www.linuxbabe.com/mail-server/opendmarc-postfix-ubuntu)

# Multiple Domain
[Multiple Mail Domains in PostfixAdmin](https://www.linuxbabe.com/mail-server/host-multiple-mail-domains-in-postfixadmin)

# Postfix Admin
[Install Postfix Admin](https://github.com/postfixadmin/postfixadmin/releases)

# Roundcube
[Install Roundcube](https://www.linuxbabe.com/ubuntu/install-roundcube-webmail-ubuntu-postgresql)

# Postfix SendOnly
[Set Up Postfix Send-Only SMTP Server on Ubuntu 22.04/20.04/18.04](https://www.linuxbabe.com/mail-server/postfix-send-only-multiple-domains-ubuntu)



# queue mangement
```bash
# view the Postfix mail queue
sudo postqueue -p

# delete specefic message from queue
sudo postsuper -d msg_id

# delete all messages from the queue
sudo postsuper -d ALL
```

# migrate to another let's encrypt certificate
## add new one
```bash
sudo mkdir -p /var/spool/postfix/etc/letsencrypt/live/example.com
sudo cp /etc/letsencrypt/live/example.com/{fullchain.pem,privkey.pem} /var/spool/postfix/etc/letsencrypt/live/example.com/

# in main.cf
smtpd_tls_cert_file = /etc/letsencrypt/live/example.com/fullchain.pem
smtpd_tls_key_file = /etc/letsencrypt/live/example.com/privkey.pem
```
## flush postfix cache
```bash
sudo systemctl stop postfix
sudo rm -rf /var/spool/postfix/private/tlsmgr/*
```
## dovecot
```bash
# edit the 10-ssl.conf
ssl_cert = </etc/letsencrypt/live/example.com/fullchain.pem
ssl_key = </etc/letsencrypt/live/example.com/privkey.pem

# remove ssl caceh (?) (possibly is not needed)
sudo systemctl stop dovecot
sudo rm -rf /var/lib/dovecot/ssl-parameters.dat
```

## restart postfix and dovecot
```bash
sudo systemctl start postfix dovecot
```
