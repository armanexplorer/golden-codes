---
title: work with docker image
---

## aliases

`docker image ls` == `docker image list` == `docker images`

## list images with filters

[Docs](https://docs.docker.com/reference/cli/docker/image/ls/)

```bash
docker images --filter "reference=*/project_token"
```

## sort

[Ref](https://www.baeldung.com/linux/docker-sort-images-by-size)

## prune

[Docs](https://docs.docker.com/reference/cli/docker/image/prune/)

Remove all dangling (untagged+unused) images. If `-a` is specified, also remove all images not referenced by any container (unused but might be tagged).

`-a`: Remove all unused images, not just dangling ones

Note: `docker prune` never removes images which are being used in some container!

```bash
# remove all unused images (including dangling and tagged ones) older than 72h
docker image prune -a --filter "until=72h"

# Also, you can add it to crontab
# At 04:30 on Friday each week
30 4 ** 5 docker image prune -a --filter "until=168h"

# using $(()) syntax
docker image prune --filter "until=$((30*24))h"
```

## remove dangling images without prune

{% raw %}

```bash
docker images --format "{{.ID}}" --filter "dangling=true" | xargs docker image rm --force
```

{% endraw %}

## busybox

BusyBox is a lightweight Linux operating system image used as the base for the sidecar container. Here's why BusyBox is a good choice in this scenario:

* **Minimal Footprint:** BusyBox is incredibly small, typically ranging from **1-5MB** depending on the variant. This keeps the overall size of your sidecar container minimal, reducing resource consumption and image transfer times.
* **Focus on Utilities:** BusyBox includes a collection of essential command-line utilities like `bash`, `cp`, `cat`, and more. This allows you to run scripts that rely on basic functionalities without needing a full-fledged Linux distribution.
* **Standalone Execution:** BusyBox is designed to run independently without relying on a larger system. This makes it ideal for creating simple containers with a single purpose, like running your custom script.

By using BusyBox, you create a lightweight and efficient container specifically designed to execute your script. It avoids the overhead of a larger operating system, making it a suitable choice for this sidecar container approach.

## example of removing specific images by script

{% raw %}

```bash
#!/bin/bash

# Get the current date
current_date=$(date +%s)

# Loop through all images
for image in $(docker images -a -q); do
    # Get the creation date of the image
    creation_date=$(docker inspect --format='{{.Created}}' $image | cut -d'T' -f1)
    creation_date_seconds=$(date -d "$creation_date" +%s)

    # Calculate the age of the image in days
    age_in_days=$((($current_date - $creation_date_seconds) / 86400))

    # Check if the image is not being used and is more than 2 days old
    if [ $age_in_days -gt 2 ] && [ -z "$(docker ps -a -q --filter="ancestor=$image")" ]; then
        echo "Removing image: $image (age: $age_in_days days)"
    fi
done
```

{% endraw %}
