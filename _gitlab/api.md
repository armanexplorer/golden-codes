---
title: all about Gitlab API
---

## copy all envs and variables

```bash
SOURCE_PROJECT_ID=18
SOURCE_ACCESS_TOKEN="<access_token>"
GITLAB_API_BASE_URL="https://example.com/api/v4"

# Get the list of environments and variables from the source project
ENVIRONMENTS=$(curl --header "PRIVATE-TOKEN: $SOURCE_ACCESS_TOKEN" "$GITLAB_API_BASE_URL/projects/$SOURCE_PROJECT_ID/environments")
VARIABLES=$(curl --header "PRIVATE-TOKEN: $SOURCE_ACCESS_TOKEN" "$GITLAB_API_BASE_URL/projects/$SOURCE_PROJECT_ID/variables")

# Create the environments and variables in the target project
TARGET_PROJECT_ID=19
TARGET_ACCESS_TOKEN="<access_token>"
echo "$ENVIRONMENTS" | jq -c '.[]' | while read environment; do
    name=$(echo "$environment" | jq -r '.name')
    external_url=$(echo "$environment" | jq -r '.external_url')
    curl --header "PRIVATE-TOKEN: $TARGET_ACCESS_TOKEN" --header "Content-Type: application/json" --data "{\"name\":\"$name\",\"external_url\":\"$external_url\"}" "$GITLAB_API_BASE_URL/projects/$TARGET_PROJECT_ID/environments"
done
echo "$VARIABLES" | jq -c '.[]' | while read variable; do
  curl --header "PRIVATE-TOKEN: $TARGET_ACCESS_TOKEN" --header "Content-Type: application/json" --data "$variable" "$GITLAB_API_BASE_URL/projects/$TARGET_PROJECT_ID/variables"
done
```

## get members of a group projects

```bash
#!/bin/bash

# Set your GitLab API token and group ID
GITLAB_API_TOKEN="YOUR_PERSONAL_ACCESS_TOKEN"
GROUP_ID="YOUR_GROUP_ID"
GITLAB_API_BASE_URL="https://example.com/api/v4"

# Function to get all projects within a group
get_projects() {
    curl -s --header "PRIVATE-TOKEN: $GITLAB_API_TOKEN" "$GITLAB_API_BASE_URL/groups/$GROUP_ID/projects" | jq -r '.[].id'
}

# Function to get members of a project
get_project_members() {
    project_id=$1
    curl -s --header "PRIVATE-TOKEN: $GITLAB_API_TOKEN" "$GITLAB_API_BASE_URL/projects/$project_id/members" | jq '.[].username'
}

# Iterate through projects and list their members
for project_id in $(get_projects); do
    project_name=$(curl -s --header "PRIVATE-TOKEN: $GITLAB_API_TOKEN" "$GITLAB_API_BASE_URL/projects/$project_id" | jq -r '.name')
    echo "Members of Project: $project_name"
    get_project_members $project_id
    echo "--------------------------------------"
done
```
