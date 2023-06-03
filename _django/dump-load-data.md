---
title: django dumpdata and loaddata commands
description: how to dump and load again data without conflict in primary key (content type app)
---


python manage.py dumpdata --natural-foreign --natural-primary -e contenttypes -e auth.Permission --indent 4 > db-2023-05-28-00-59.json
python manage.py loaddata db-2023-05-28-00-59.json
