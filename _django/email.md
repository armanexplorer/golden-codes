---
title: email in django
---

[Docs](https://docs.djangoproject.com/en/5.0/topics/email/)

```py
# Import necessary modules
from django.core.mail import send_mail
from django.conf import settings

# Define the email details
subject = "Test Email"
message = "This is a test email sent using Django."
from_email = settings.EMAIL_HOST_USER
to_email = ["recipient@example.com"]

# Send the email
send_mail(
    subject,
    message,
    from_email,
    to_email,
    fail_silently=False,
)
```
