---
title: script to remove old images
---

```bash
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
        #! only uncomment the following if you are sure the images are OK!
        # docker rmi $image
    fi
done

```
