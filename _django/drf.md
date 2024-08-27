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

## serializer source field

[Docs](https://www.django-rest-framework.org/api-guide/fields/#source)

The name of the `attribute` that will be used to populate the field. May be a `method` that only takes a `self` argument, such as URLField(source='get_absolute_url'), or may use `dotted notation` to traverse attributes, such as EmailField(source='user.email').

When serializing fields with `dotted notation`, it may be necessary to provide a `default` value if any object is `not present` or is `empty` during attribute traversal. Beware of possible `n+1 problems` when using source attribute if you are accessing a relational orm model. For example:

```py
class CommentSerializer(serializers.Serializer):
    email = serializers.EmailField(source="user.email")
```

This case would require user object to be fetched from database when it is not prefetched. If that is not wanted, be sure to be using `prefetch_related` and `select_related` methods appropriately. For more information about the methods refer to django documentation.

The value `source='*'` has a special meaning, and is used to indicate that the `entire object` should be passed through to the field. This can be useful for creating nested representations, or for fields which require access to the complete object in order to determine the output representation.

**Defaults to the name of the field.**

### source='*'

[Docs](https://www.django-rest-framework.org/api-guide/fields/#using-source)
