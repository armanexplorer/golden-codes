---
title: how to debug email smtp
---

## good troubleshooting

[ref](https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting)

## check the smtp is up

```bash
telnet smtp.gmail.com 587 # (or 25 or 465)
```

## check the smtp works on STARTTLS

```bash
openssl s_client -starttls smtp -connect mail.example.com:587 # (or 25 or 465)
```
