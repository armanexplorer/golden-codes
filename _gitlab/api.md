---
---


# copy all envs and variables
```bash
# Get the list of environments and variables from the source project
SOURCE_PROJECT_ID=18
SOURCE_ACCESS_TOKEN="<access_token>"
ENVIRONMENTS=$(curl --header "PRIVATE-TOKEN: $SOURCE_ACCESS_TOKEN" "https://gitlab.eridanus.ir/api/v4/projects/$SOURCE_PROJECT_ID/environments")
VARIABLES=$(curl --header "PRIVATE-TOKEN: $SOURCE_ACCESS_TOKEN" "https://gitlab.eridanus.ir/api/v4/projects/$SOURCE_PROJECT_ID/variables")

# Create the environments and variables in the target project
TARGET_PROJECT_ID=19
TARGET_ACCESS_TOKEN="<access_token>"
echo "$ENVIRONMENTS" | jq -c '.[]' | while read environment; do
    name=$(echo "$environment" | jq -r '.name')
    external_url=$(echo "$environment" | jq -r '.external_url')
    curl --header "PRIVATE-TOKEN: $TARGET_ACCESS_TOKEN" --header "Content-Type: application/json" --data "{\"name\":\"$name\",\"external_url\":\"$external_url\"}" "https://gitlab.eridanus.ir/api/v4/projects/$TARGET_PROJECT_ID/environments"
done
echo "$VARIABLES" | jq -c '.[]' | while read variable; do
  curl --header "PRIVATE-TOKEN: $TARGET_ACCESS_TOKEN" --header "Content-Type: application/json" --data "$variable" "https://gitlab.eridanus.ir/api/v4/projects/$TARGET_PROJECT_ID/variables"
done
```