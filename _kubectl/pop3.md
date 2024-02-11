---
title: add pop3 support
---

## add pop3 support

[Docs](https://docker-mailserver.github.io/docker-mailserver/latest/config/pop3/)

```bash
mailserver:
  ports:
    - "25:25"    # SMTP  (explicit TLS => STARTTLS)
    - "143:143"  # IMAP4 (explicit TLS => STARTTLS)
    - "465:465"  # ESMTP (implicit TLS)
    - "587:587"  # ESMTP (explicit TLS => STARTTLS)
    - "993:993"  # IMAP4 (implicit TLS)
    - "110:110"  # POP3
    - "995:995"  # POP3 (with TLS)
  environment:
    - ENABLE_POP3=1
```
