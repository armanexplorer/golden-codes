---
title: how to set/change the user password in django
---

## set in creating user

[Docs](https://docs.djangoproject.com/en/5.0/topics/auth/default/#creating-users)

```py
from django.contrib.auth.models import User
user= User.objects.create_user(‘john’, ’johnDoe@tutorialspoint.com’,’ttspassword’)
user.save()
```

## change password

[Docs](https://docs.djangoproject.com/en/5.0/topics/auth/default/#changing-passwords)

From command line

```bash
manage.py changepassword *username*
```

Programitcally:

```py
from django.contrib.auth.models import User
u = User.objects.get(username=’john’)
u.set_password(‘new password’)
u.save()
```

Also, you can do this in Django Admin
