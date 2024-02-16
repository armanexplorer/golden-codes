---
title: work with sesssions
---

## settings values

[Docs](https://docs.djangoproject.com/en/3.2/ref/settings/#session-cookie-age)

## force expire a sesssion

[Docs](https://docs.djangoproject.com/en/3.2/topics/http/sessions/#configuring-the-session-engine)

```py
from django.contrib.sessions.models import Session
from django.utils.timezone import datetime


# find the session key form cookie value of `sessionid` in the browser
s = Session.objects.get(pk='2b1189a188b44ad18c35e113ac6ceead')
# or
s = Session.objects.get(session_key='2b1189a188b44ad18c35e113ac6ceead')

# show the expire date
s.expire_date

# set new date
s.expire_date = datetime.now()
s.save()

# show decoded form
s.get_decoded()
```
