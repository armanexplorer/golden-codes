---
title: all about Django Rest Framework (DRF)
---

## sample projects

[Sample Project](https://github.com/erdem/DRF-TDD-example/tree/master)

[Sample template project](https://github.com/weynelucas/drf-project-template/tree/master)

## disable browsable API

[Disable DRF Browsable API Interface](https://studygyaan.com/django/disabling-django-rest-frameworks-browsable-api-interface?amp=1)

### Based on Debug

```py
if not DEBUG:
    REST_FRAMEWORK["DEFAULT_RENDERER_CLASSES"] = (
            "rest_framework.renderers.JSONRenderer",
        )
```

## part of codes

[codes](https://github.com/encode/django-rest-framework/tree/master/rest_framework)

[generics.py](https://github.com/encode/django-rest-framework/blob/master/rest_framework/generics.py)

## recursive fields (like Children Nodes in a Tree)

<https://github.com/heywbj/django-rest-framework-recursive>

## dataclass support for serializer

<https://github.com/oxan/djangorestframework-dataclasses>

## nested routes

<https://github.com/alanjds/drf-nested-routers>

## support GIS (Geographic fields)

<https://github.com/openwisp/django-rest-framework-gis>

## JWT auth plugin

<https://github.com/jazzband/djangorestframework-simplejwt>

<https://github.com/Styria-Digital/django-rest-framework-jwt>

## auth

<https://github.com/iMerica/dj-rest-auth>

## standardize errors

<https://github.com/ghazi-git/drf-standardized-errors>

<https://drf-standardized-errors.readthedocs.io/en/latest/quickstart.html>
