---
title: clients for sending emails
---

## swaks

[Install](https://www.jetmore.org/john/code/swaks/installation.html)

```bash
curl -O https://jetmore.org/john/code/swaks/files/swaks-20240103.0/swaks
```

```bash
swaks --auth \
       --server smtp.mailgun.org:587 \
	   --from postmaster@website.com \
       --au postmaster@website.com \
       --ap 'the_password' \
       --to myemailaddress@gmail.com \
       --h-Subject: "Welcome To Our Website" \
	   --h-From: 'Website Info <info@website.com>' \
       --body 'Dear friend\nWelcome to our world of fun'


swaks --auth \
       --server smtp.eu.mailgun.org:587 \
	   --from no-reply@website.net \
       --au postmaster@mg.website.net \
       --ap 'the_password' \
       --to myemailaddress@gmail.com \
       --h-Subject: "Welcome To Our Website" \
	   --h-From: 'Website <no-reply@website.net>' \
       --body 'Dear Arman\nWelcome to our world of fun'
```

[Docs](https://github.com/jetmore/swaks/blob/v20240103.0/doc/base.pod)

[Repo](https://github.com/jetmore/swaks)

## python client

[ref](https://realpython.com/python-send-email/)

```py
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

def send_email(subject, message, from_addr, to_addr, password):
    msg = MIMEMultipart()
    msg['From'] = from_addr
    msg['To'] = to_addr
    msg['Subject'] = subject

    body = message
    msg.attach(MIMEText(body, 'plain'))

    server = smtplib.SMTP('smtp.mailgun.org', 587)
    server.starttls()
    server.login(from_addr, password)
    text = msg.as_string()
    server.sendmail(from_addr, to_addr, text)
    server.quit()

# Example usage:
subject = "Test Email"
message = "This is a test email."
from_addr = "postmaster@website.mailgun.org"
to_addr = "my_email_address@gmail.com"
password = ""

send_email(subject, message, from_addr, to_addr, password)
```

## msmtp, mutt

[Link](https://www.baeldung.com/linux/send-emails-from-terminal)

## curl, mail, mpack

[Link](https://mailtrap.io/blog/linux-send-email/)

## openssl

[Link](https://www.baeldung.com/linux/openssl-send-emails)
