---
title: how to configure Python console without enabling Django
---


Set Pycharm Python Console Settings path:

```conf
DJANGO_SETTINGS_MODULE=config.settings.local
```

Put this in the Starting script:

```py
import sys; print('Python %s on %s' % (sys.version, sys.platform))
import django; print('Django %s' % django.get_version())
sys.path.extend([WORKING_DIR_AND_PYTHON_PATHS])

from dotenv import load_dotenv
from pathlib import Path
WORKING_DIR = [WORKING_DIR_AND_PYTHON_PATHS][0]
dotenv_path = Path(WORKING_DIR) / 'envs' / 'local.env'
load_dotenv(dotenv_path)

if 'setup' in dir(django): django.setup()
```

Another config (old):

```py
import os
import sys; print('Python %s on %s' % (sys.version, sys.platform))
from dotenv import load_dotenv
from pathlib import Path
WORKING_DIR = [WORKING_DIR_AND_PYTHON_PATHS][0]
sys.path.extend([WORKING_DIR_AND_PYTHON_PATHS])
dotenv_path = Path(WORKING_DIR) / 'envs' / 'local.env'
load_dotenv(dotenv_path)
from django.conf import settings
from django.utils import autoreload
import django
autoreload.check_errors(django.setup)()
```
