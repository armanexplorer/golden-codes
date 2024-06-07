---
title: create docker image from contianer
---

```bash
# get ubuntu image and run it
docker run -t -i ubuntu /bin/bash

# create a new directory there
touch /TEST

exit

# create an image from the last conatiner created
docker commit $(docker ps -lq) test-image

# deploy it to registry
docker tag test-image your_domain/test-image
docker push your_domain/test-image
```
