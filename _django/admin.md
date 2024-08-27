---
title: all about Django admin and management
---

[colors in admin and management](https://docs.djangoproject.com/en/5.0/ref/django-admin/#syntax-coloring)

[custom command](https://docs.djangoproject.com/en/5.0/howto/custom-management-commands/)

[Repo code](https://github.com/django/django/blob/stable/5.1.x/django/utils/termcolors.py#L81)

## configure admin emails

```py
ADMINS = [
    ('Your Name', 'your_email@example.com'),
    # Add more admins as a tuple with name and email
]

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
SERVER_EMAIL = 'your_email@example.com' ## IMPORTANT

# Replace with your actual SMTP server details
EMAIL_HOST = 'smtp.example.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True  # Use TLS for secure communication
EMAIL_HOST_USER = 'your_email@example.com'
EMAIL_HOST_PASSWORD = 'your_email_password' # pragma: allowlist secret
```

You can also change the EmailBackend and create a custom one like this:

```bash
from django.core.mail.backends.base import BaseEmailBackend

class CustomEmailBackend(BaseEmailBackend):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.from_email = 'custom_from@example.com'  # Set your desired email here

    def send_messages(self, messages):
        for message in messages:
            message.from_email = self.from_email  # Override the From email for each message
            super().send_messages([message])

```

## related models

Inline mode:

```py
from django.contrib import admin
from .models import Book, Author

class AuthorInline(admin.TabularInline):
    model = Author
    extra = 1  # Optional: Number of empty forms to show

class BookAdmin(admin.ModelAdmin):
    inlines = [AuthorInline]

admin.site.register(Book, BookAdmin)
```



```py
from django.contrib import admin
from django.utils.html import format_html
from .models import Book, Author

def author_link(obj):
    return format_html('<a href="{}">{}</a>', reverse('admin:app_author_change', args=[obj.author.id]), obj.author.name)
author_link.short_description = 'Author'

class BookAdmin(admin.ModelAdmin):
    list_display = ('title', author_link, 'publication_date')

admin.site.register(Book, BookAdmin)
```
