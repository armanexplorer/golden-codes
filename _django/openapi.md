---
title: add OpenAPI to django
---

## drf-spectacular

[Repo](https://github.com/tfranzel/drf-spectacular#self-contained-ui-installation)

[Docs](https://drf-spectacular.readthedocs.io/en/latest/index.html)

```bash
./manage.py spectacular --file schema.yaml --validate --fail-on-warn
```

### sidecar

To not need to fetch json/css files on server (maybe because not public to internet), we can use this package:

[Repo](https://github.com/tfranzel/drf-spectacular-sidecar)