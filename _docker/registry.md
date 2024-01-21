---
title: docker registry install and configurations 
description: 
---

[Configs](https://gdevillele.github.io/registry/configuration/)
[Documents](https://distribution.github.io/distribution/about/deploying/)
[Doc2](https://phoenixnap.com/kb/set-up-a-private-docker-registry)
[Parspack Manual](https://parspack.com/blog/os/linux/ubuntu/how-to-set-up-a-private-docker-registry-on-ubuntu-22-04)

# install docker registry
[Reference](https://docs.docker.com/registry/deploying/)

## docker compose
```yaml
version: '3.8'

services:

  registry:
    image: registry:2
    container_name: registry
    restart: always
    ports:
      - "5000:5000"
    environment:
      TZ: Asia/Tehran
      REGISTRY_AUTH: htpasswd
      REGISTRY_AUTH_HTPASSWD_REALM: Registry-Realm
      REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
      REGISTRY_STORAGE_DELETE_ENABLED: true
      REGISTRY_HTTP_SECRET: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX # you shoud get some random thing

      # this will remove the extra pahts to the data
      # REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY: /data
    volumes:
      - ./data:/var/lib/registry  # it is better to put `./data:/data` instead, but you should set REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/data env
      - ./auth:/auth
      - ./config:/etc/docker/registry
```
# set basic auth
```bash
DOCKER_REGISTRY_BASIC_AUTH_DIR=docker_reg_basic_auth
mkdir $DOCKER_REGISTRY_BASIC_AUTH_DIR
docker run \
  --entrypoint htpasswd \
  httpd:2 -Bbn USERNAME PASSWORD > $DOCKER_REGISTRY_BASIC_AUTH_DIR/htpasswd
docker container stop registry
docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  -v "$(pwd)"/$DOCKER_REGISTRY_BASIC_AUTH_DIR:/auth \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
  -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
  registry:2
```

# list repositories
```bash
https://docker.example.com/v2/_catalog
```

# list tags of the repo
```bash
https://docker.example.com/v2/{repository_name}/tags/list
```

# delete all the images of a repo which have no special tag (dev, latest, test) from the registry 
```bash
# steps: get tags, check has no special tag, get the manifest digest using its tag, delete the manifest using digest
curl -sS -X GET -H "Authorization: Basic XXXXXXXXXXXXXXXXXXX" https://docker.example.com/v2/project_token/tags/list | jq -r '.tags[]' | grep -vE 'dev$|latest|test' | xargs -I{} sh -c $'curl -sS -I -H "Authorization: Basic XXXXXXXXXXXXXXXXXXX" -H "Accept: application/vnd.docker.distribution.manifest.v2+json" https://docker.example.com/v2/project_token/manifests/{} | grep Docker-Content-Digest | cut -d" " -f2 | sed \'s/\s//g\' | xargs -I[] curl -I -X DELETE -H "Authorization: Basic XXXXXXXXXXXXXXXXXXX" "https://docker.example.com/v2/project_token/manifests/[]"'
```

# run garbage collector of the image registry (-m is equal to --delete-untagged=true)
```bash
docker exec -it registry bin/registry garbage-collect /etc/docker/registry/config.yml -m
```

# migrate old docker registry to new one
```bash
#!/bin/bash

# Set the source and destination registry URLs
SOURCE_REGISTRY_URL="example.com"
DESTINATION_REGISTRY_URL="example.com"

# Authenticate with the source registry
#docker login $SOURCE_REGISTRY_URL

# Get a list of all the images in the source registry
IMAGE_LIST=$(docker image ls --format "{{.Repository}}:{{.Tag}}" | grep $SOURCE_REGISTRY_URL)
# Loop through the list of images and push them to the destination registry
for IMAGE in $IMAGE_LIST
do
  NEW_IMAGE="$DESTINATION_REGISTRY_URL/$(echo $IMAGE | cut -d'/' -f2-)"
  echo $IMAGE
  echo $NEW_IMAGE
  docker pull $IMAGE
  docker tag $IMAGE $NEW_IMAGE
  docker push $NEW_IMAGE
  echo -e "DONE!\n"
done
```