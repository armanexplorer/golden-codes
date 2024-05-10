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
