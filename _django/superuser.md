---
title: how to work with superuser in django
---

## auto create superuser

[Make it auto](https://stackoverflow.com/questions/30027203/create-django-super-user-in-a-docker-container-without-inputting-password)


## print superuser emails

```py
superusers = User.objects.filter(is_superuser=True)
for superuser in superusers:
    print(superuser.email)
```

## set new password

```bash
python manage.py changepassword <username>
```

or by code:

```py
from django.contrib.auth.models import User

# Get the superuser
superuser = User.objects.get(username='admin')

# Set the new password
superuser.set_password('new_password')
superuser.save()
```
